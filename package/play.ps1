# KOTOR Academy launcher.
# Finds the games it needs wherever they are installed (Steam libraries,
# the list of installed programs, the usual folders, or a folder the player
# points at once), says plainly what is missing, and starts the game. It
# only ever reads those folders; it changes nothing in them.
$ErrorActionPreference = 'Stop'
# Joins path parts without touching the disk (a drive that is not there is no error).
function Join([string]$a, [string]$b) { [System.IO.Path]::Combine($a, $b) }
$here = Split-Path -Parent $MyInvocation.MyCommand.Path
$game = Join $here 'kjk.exe'

# The launcher runs with no console window: everything it says is a message box.
Add-Type -AssemblyName System.Windows.Forms
function Tell([string]$text, [string]$icon = 'Information') {
    [void][System.Windows.Forms.MessageBox]::Show($text, 'KOTOR Academy', 'OK', $icon)
}
function Stop-With([string[]]$lines) {
    Tell (("KOTOR Academy cannot start yet.`n`n" + ($lines -join "`n") + "`n`nSee README for the full install steps.")) 'Warning'
    exit 1
}
trap {
    Tell ("KOTOR Academy could not start.`n`n" + $_.Exception.Message) 'Warning'
    exit 1
}

if (-not (Test-Path -LiteralPath $game -PathType Leaf)) {
    Stop-With @('kjk.exe is missing from this folder. Extract the whole zip and run this file from inside it.')
}

# paths.txt: optional lines such as  KOTOR1=D:\Games\swkotor
$named = @{}
$pathsFile = Join $here 'paths.txt'
if (Test-Path -LiteralPath $pathsFile -PathType Leaf) {
    foreach ($line in Get-Content -LiteralPath $pathsFile) {
        $text = $line.Trim()
        if ($text -eq '' -or $text.StartsWith('#')) { continue }
        $at = $text.IndexOf('=')
        if ($at -lt 1) { continue }
        $value = $text.Substring($at + 1).Trim().Trim('"')
        if ($value -ne '') { $named[$text.Substring(0, $at).Trim().ToUpperInvariant()] = $value }
    }
}

# Every Steam library on this PC.
$libraries = New-Object System.Collections.Generic.List[string]
foreach ($key in 'HKCU:\Software\Valve\Steam', 'HKLM:\SOFTWARE\WOW6432Node\Valve\Steam', 'HKLM:\SOFTWARE\Valve\Steam') {
    try {
        $entry = Get-ItemProperty -Path $key -ErrorAction Stop
        foreach ($name in 'SteamPath', 'InstallPath') {
            $root = $entry.$name
            if ($root) { $libraries.Add(($root -replace '/', '\')) }
        }
    } catch { }
}
foreach ($root in @($libraries)) {
    $list = Join $root 'steamapps\libraryfolders.vdf'
    if (Test-Path -LiteralPath $list -PathType Leaf) {
        foreach ($line in Get-Content -LiteralPath $list) {
            if ($line -match '"path"\s+"([^"]+)"') { $libraries.Add(($Matches[1] -replace '\\\\', '\')) }
        }
    }
}
$libraries = @($libraries | Sort-Object -Unique)

# Where Windows says a program is installed (any installer that registers itself).
function Find-Installed([string]$pattern) {
    $found = New-Object System.Collections.Generic.List[string]
    foreach ($root in 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall', 'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall', 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall') {
        foreach ($entry in Get-ChildItem -Path $root -ErrorAction SilentlyContinue) {
            try {
                $values = Get-ItemProperty -Path $entry.PSPath -ErrorAction Stop
                if ($values.DisplayName -and $values.DisplayName -match $pattern -and $values.InstallLocation) {
                    $found.Add(([string]$values.InstallLocation).Trim('"').TrimEnd('\'))
                }
            } catch { }
        }
    }
    return $found
}

# The folder of a game: the one paths.txt names, a Steam library's, one
# Windows lists as installed, or a usual place. $marker is a file only that
# game has.
function Find-Game([string]$key, [string]$steamFolder, [string]$pattern, [string[]]$usual, [string]$marker) {
    $candidates = New-Object System.Collections.Generic.List[string]
    if ($named.ContainsKey($key)) { $candidates.Add($named[$key]) }
    foreach ($library in $libraries) { $candidates.Add((Join $library ('steamapps\common\' + $steamFolder))) }
    foreach ($place in (Find-Installed $pattern)) { $candidates.Add($place) }
    foreach ($drive in [System.IO.DriveInfo]::GetDrives() | Where-Object { $_.DriveType -eq 'Fixed' }) {
        foreach ($folder in $usual) { $candidates.Add((Join $drive.Name $folder)) }
    }
    foreach ($candidate in $candidates) {
        if ($candidate -and (Test-Path -LiteralPath (Join $candidate $marker))) { return $candidate }
    }
    return $null
}

# Remembers a folder in paths.txt, so it is asked for once only.
function Save-Path([string]$key, [string]$folder) {
    $lines = @()
    if (Test-Path -LiteralPath $pathsFile -PathType Leaf) {
        $lines = @(Get-Content -LiteralPath $pathsFile | Where-Object { $_ -notmatch ('^\s*' + $key + '\s*=') })
    }
    $lines += "$key=$folder"
    Set-Content -LiteralPath $pathsFile -Value $lines -Encoding UTF8
    $named[$key] = $folder
}

# Asks the player to point at a game's folder. The folder picked, the one
# above it or the one above that may be the game's (picking GameData or
# base inside Jedi Academy is fine). Nothing picked: $null.
function Ask-Folder([string]$what, [string]$marker) {
    Add-Type -AssemblyName System.Windows.Forms
    while ($true) {
        $dialog = New-Object System.Windows.Forms.FolderBrowserDialog
        $dialog.Description = "Choose the folder where $what is installed."
        $dialog.ShowNewFolderButton = $false
        if ($dialog.ShowDialog() -ne [System.Windows.Forms.DialogResult]::OK) { return $null }
        $picked = $dialog.SelectedPath
        foreach ($folder in $picked, (Split-Path -Parent $picked), (Split-Path -Parent (Split-Path -Parent $picked))) {
            if ($folder -and (Test-Path -LiteralPath (Join $folder $marker))) { return $folder }
        }
        Tell "That folder does not look like $what (no $marker in it). Try again, or press Cancel." 'Warning'
    }
}

function Ask-Yes([string]$question) {
    return [System.Windows.Forms.MessageBox]::Show($question, 'KOTOR Academy', 'YesNo', 'Question') -eq [System.Windows.Forms.DialogResult]::Yes
}

$kotor1Marker = 'swkotor.exe'
$kotor2Marker = 'swkotor2.exe'
$academyMarker = 'GameData\base\assets0.pk3'
$kotor1 = Find-Game 'KOTOR1' 'swkotor' 'Knights of the Old Republic(?!.*(II|2|Sith Lords))' @('GOG Games\Star Wars - KotOR', 'Program Files (x86)\GOG Galaxy\Games\Star Wars - KotOR', 'Program Files (x86)\LucasArts\SWKotOR') $kotor1Marker
$kotor2 = Find-Game 'KOTOR2' 'Knights of the Old Republic II' 'Knights of the Old Republic.*(II|2|Sith Lords)' @('GOG Games\Star Wars - KotOR2', 'Program Files (x86)\GOG Galaxy\Games\Star Wars - KotOR2', 'Program Files (x86)\LucasArts\SWKotOR2') $kotor2Marker
$academy = Find-Game 'JEDIACADEMY' 'Jedi Academy' 'Jedi Academy' @('GOG Games\Star Wars Jedi Knight - Jedi Academy', 'Program Files (x86)\GOG Galaxy\Games\Star Wars Jedi Knight - Jedi Academy', 'Program Files (x86)\LucasArts\Star Wars Jedi Knight Jedi Academy') $academyMarker

# Not found by itself: the player points at it, once. KOTOR II is always
# needed (every menu is drawn with its files, KOTOR I's too); KOTOR I only
# to play KOTOR I, so it is asked for once and then left alone.
if (-not $kotor2) {
    if (Ask-Yes "Knights of the Old Republic II was not found on this PC.`n`nKOTOR Academy needs it, even to play KOTOR I. Is it installed? Click Yes to choose its folder.") {
        $kotor2 = Ask-Folder 'Knights of the Old Republic II' $kotor2Marker
        if ($kotor2) { Save-Path 'KOTOR2' $kotor2 }
    }
}
if ($kotor2 -and -not $kotor1 -and -not $named.ContainsKey('KOTOR1ASKED')) {
    if (Ask-Yes "Knights of the Old Republic (the first game) was not found on this PC.`n`nIt is only needed to play KOTOR I. Is it installed? Click Yes to choose its folder, or No to play KOTOR II only.") {
        $kotor1 = Ask-Folder 'Knights of the Old Republic' $kotor1Marker
        if ($kotor1) { Save-Path 'KOTOR1' $kotor1 }
    }
    if (-not $kotor1) { Save-Path 'KOTOR1ASKED' 'yes' }
}
if (-not $academy) {
    if (Ask-Yes "Jedi Knight: Jedi Academy was not found on this PC.`n`nIs it installed? Click Yes to choose its folder.") {
        $academy = Ask-Folder 'Jedi Academy' $academyMarker
        if ($academy) { Save-Path 'JEDIACADEMY' $academy }
    }
}

# Movie Duels: its archives beside Jedi Academy's, or the folder paths.txt names.
function Find-Duels {
    $places = New-Object System.Collections.Generic.List[string]
    if ($named.ContainsKey('MOVIEDUELS')) {
        $places.Add($named['MOVIEDUELS'])
        $places.Add((Join $named['MOVIEDUELS'] 'base'))
        $places.Add((Join $named['MOVIEDUELS'] 'GameData\base'))
    }
    if ($academy) {
        $places.Add((Join $academy 'GameData\base'))
        foreach ($folder in Get-ChildItem -LiteralPath (Join $academy 'GameData') -Directory -ErrorAction SilentlyContinue) {
            $places.Add($folder.FullName)
        }
    }
    foreach ($place in $places) {
        if (Test-Path -LiteralPath (Join $place 'MD_Assets2.pk3') -PathType Leaf) { return $place }
    }
    return $null
}
$duels = Find-Duels
if ($academy -and -not $duels) {
    if (Ask-Yes "Movie Duels was not found beside Jedi Academy.`n`nIs it installed somewhere else? Click Yes to choose its folder.") {
        $picked = Ask-Folder 'Movie Duels (the folder holding MD_Assets2.pk3)' 'MD_Assets2.pk3'
        if ($picked) { Save-Path 'MOVIEDUELS' $picked; $duels = Find-Duels }
    }
}

$missing = New-Object System.Collections.Generic.List[string]
if (-not $kotor2) {
    $missing.Add('- Star Wars: Knights of the Old Republic II is needed, even to play KOTOR I')
    $missing.Add('  (the menus are drawn with its files). Install it.')
}
if (-not $academy) {
    $missing.Add('- Star Wars Jedi Knight: Jedi Academy is needed. Install it.')
}
if ($academy -and -not $duels) {
    $missing.Add('- Movie Duels is needed. Install "Movie Duels - Update 6 + Patch AIO" from')
    $missing.Add('  https://www.moddb.com/mods/movie-duels/downloads')
}
if ($missing.Count -gt 0) {
    $missing.Add('')
    $missing.Add('Then run this file again.')
    Stop-With $missing
}

if ($kotor1) { $env:KJK_KOTOR1 = $kotor1 }
if ($kotor2) { $env:KJK_KOTOR2 = $kotor2 }
# The game reads Jedi Academy's own four archives and nothing else. Movie
# Duels installs its files into the same folder, where they would replace
# Jedi Academy's animations, so the four are copied once into a folder of
# their own here (about 1 GB). The install itself is only read.
$cleanAcademy = Join $here 'jedi-academy'
$cleanBase = Join $cleanAcademy 'base'
$todo = New-Object System.Collections.Generic.List[string]
foreach ($name in 'assets0.pk3', 'assets1.pk3', 'assets2.pk3', 'assets3.pk3') {
    $from = Join $academy (Join 'GameData' (Join 'base' $name))
    $to = Join $cleanBase $name
    if (-not (Test-Path -LiteralPath $from -PathType Leaf)) { Stop-With @("Jedi Academy's $name is missing. Reinstall Jedi Academy.") }
    if (-not (Test-Path -LiteralPath $to -PathType Leaf) -or (Get-Item -LiteralPath $to).Length -ne (Get-Item -LiteralPath $from).Length) { $todo.Add($name) }
}
if ($todo.Count -gt 0) {
    [void](New-Item -ItemType Directory -Path $cleanBase -Force)
    Add-Type -AssemblyName System.Drawing
    $wait = New-Object System.Windows.Forms.Form
    $wait.Text = 'KOTOR Academy'
    $wait.StartPosition = 'CenterScreen'
    $wait.FormBorderStyle = 'FixedDialog'
    $wait.ControlBox = $false
    $wait.ClientSize = New-Object System.Drawing.Size(420, 90)
    $note = New-Object System.Windows.Forms.Label
    $note.Text = 'Getting Jedi Academy''s files ready. This happens once and takes about a minute.'
    $note.TextAlign = 'MiddleCenter'
    $note.Dock = 'Fill'
    $wait.Controls.Add($note)
    $wait.Show()
    [System.Windows.Forms.Application]::DoEvents()
    foreach ($name in $todo) {
        Copy-Item -LiteralPath (Join $academy (Join 'GameData' (Join 'base' $name))) -Destination (Join $cleanBase $name) -Force
        [System.Windows.Forms.Application]::DoEvents()
    }
    $wait.Close()
    $wait.Dispose()
}
$env:KJK_JA = $cleanAcademy
$env:KJK_MOVIEDUELS = $duels

# Optional: loose KOTOR I mod files (textures, models) in the mods folder.
$mods = Join $here 'mods'
if (-not (Test-Path -LiteralPath $mods -PathType Container)) { [void](New-Item -ItemType Directory -Path $mods -Force) }
if ((Test-Path -LiteralPath $mods -PathType Container) -and @(Get-ChildItem -LiteralPath $mods -File -Recurse | Select-Object -First 1).Count -gt 0) {
    $env:KJK_MOD_ROOT = $mods
}

# Optional: the Duel Room mod, for KOTOR I's combat arena.
$arena = Join $here 'arena'
$layout = Join $here 'arena-layout.json'
if ((Test-Path -LiteralPath $arena -PathType Container) -and (Test-Path -LiteralPath $layout -PathType Leaf)) {
    $room = Get-ChildItem -LiteralPath $arena -Filter 'goroom.mod' -File -Recurse -ErrorAction SilentlyContinue | Select-Object -First 1
    if ($room -and $room.Directory.Name -ieq 'Modules') {
        $env:KJK_PRACTICE_ROOT = $room.Directory.Parent.FullName
        $env:KJK_PRACTICE_LAYOUT = $layout
    }
}

# A window asks which game to play: KOTOR on the left, KOTOR II on the
# right, a game that is not installed greyed out. Closed without a choice:
# $null. $picture draws the window into a file instead (for review).
function Pick-Game([string]$picture) {
    Add-Type -AssemblyName System.Windows.Forms
    Add-Type -AssemblyName System.Drawing
    [System.Windows.Forms.Application]::EnableVisualStyles()
    $gold = [System.Drawing.Color]::FromArgb(236, 186, 84)
    $coverFile = Join $here 'cover.jpg'
    $cover = $null
    if (Test-Path -LiteralPath $coverFile -PathType Leaf) { $cover = [System.Drawing.Image]::FromFile($coverFile) }
    $width = 520
    $top = 0
    if ($cover) { $width = $cover.Width; $top = $cover.Height }
    $form = New-Object System.Windows.Forms.Form
    $form.Text = 'KOTOR Academy'
    $form.StartPosition = 'CenterScreen'
    $form.FormBorderStyle = 'FixedDialog'
    $form.MaximizeBox = $false
    $form.MinimizeBox = $false
    $form.BackColor = [System.Drawing.Color]::FromArgb(6, 6, 8)
    $form.ClientSize = New-Object System.Drawing.Size($width, ($top + 78))
    if ($cover) {
        $art = New-Object System.Windows.Forms.PictureBox
        $art.Image = $cover
        $art.SetBounds(0, 0, $width, $top)
        $form.Controls.Add($art)
    }
    $gap = 12
    $each = [int](($width - 3 * $gap) / 2)
    $left = $gap
    foreach ($choice in @(@('k1', 'KOTOR', $kotor1), @('tsl', 'KOTOR II', $kotor2))) {
        $button = New-Object System.Windows.Forms.Button
        $button.Text = $choice[1]
        $button.Tag = $choice[0]
        $button.Enabled = [bool]$choice[2]
        $button.Font = New-Object System.Drawing.Font('Georgia', 15, [System.Drawing.FontStyle]::Bold)
        $button.FlatStyle = 'Flat'
        $button.FlatAppearance.BorderColor = $gold
        $button.FlatAppearance.BorderSize = 2
        $button.FlatAppearance.MouseOverBackColor = [System.Drawing.Color]::FromArgb(60, 34, 10)
        $button.ForeColor = $gold
        $button.BackColor = [System.Drawing.Color]::FromArgb(24, 14, 6)
        $button.Cursor = [System.Windows.Forms.Cursors]::Hand
        $button.SetBounds($left, ($top + $gap), $each, 54)
        $button.Add_Click({ $form.Tag = $this.Tag; $form.Close() })
        $form.Controls.Add($button)
        $left += $each + $gap
    }
    if ($picture) {
        $form.Show()
        [System.Windows.Forms.Application]::DoEvents()
        $shot = New-Object System.Drawing.Bitmap($form.ClientSize.Width, $form.ClientSize.Height)
        $paint = [System.Drawing.Graphics]::FromImage($shot)
        $paint.Clear($form.BackColor)
        foreach ($control in @($form.Controls)) {
            $piece = New-Object System.Drawing.Bitmap($control.Width, $control.Height)
            $control.DrawToBitmap($piece, (New-Object System.Drawing.Rectangle(0, 0, $control.Width, $control.Height)))
            $paint.DrawImage($piece, $control.Left, $control.Top)
            $piece.Dispose()
        }
        $paint.Dispose()
        $shot.Save($picture, [System.Drawing.Imaging.ImageFormat]::Png)
        $shot.Dispose()
        $form.Close()
    } else {
        [void]$form.ShowDialog()
    }
    $picked = [string]$form.Tag
    $form.Dispose()
    if ($cover) { $cover.Dispose() }
    if ($picked) { return $picked }
    return $null
}

# A desktop shortcut, offered once (the answer is kept in paths.txt).
$desktop = [Environment]::GetFolderPath('Desktop')
$shortcut = Join $desktop 'KOTOR Academy.lnk'
if ($desktop -and -not $named.ContainsKey('SHORTCUT') -and -not (Test-Path -LiteralPath $shortcut)) {
    if (Ask-Yes 'Put a KOTOR Academy shortcut on your desktop?') {
        $link = (New-Object -ComObject WScript.Shell).CreateShortcut($shortcut)
        $link.TargetPath = Join $env:SystemRoot 'System32\WindowsPowerShell\v1.0\powershell.exe'
        $link.Arguments = '-NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "' + (Join $here 'play.ps1') + '"'
        $link.WindowStyle = 7
        $link.WorkingDirectory = $here
        $link.IconLocation = "$game,0"
        $link.Description = 'KOTOR Academy'
        $link.Save()
        Save-Path 'SHORTCUT' 'yes'
    } else {
        Save-Path 'SHORTCUT' 'no'
    }
}

if ($env:KOTORACADEMY_SELECTOR_PICTURE) {
    [void](Pick-Game $env:KOTORACADEMY_SELECTOR_PICTURE)
    exit 0
}
if ($kotor1 -and $kotor2) {
    $campaign = Pick-Game ''
    # The window closed without a choice: nothing launches.
    if (-not $campaign) { exit 0 }
} elseif ($kotor2) {
    $campaign = 'tsl'
} else {
    $campaign = 'k1'
}
$env:KJK_CAMPAIGN = $campaign

# DirectX 12 is the graphics mode the game is tested with. Left to choose,
# it picks Vulkan, which is untested and under which controllers were seen to
# drop out. Set WGPU_BACKEND yourself to use another.
$forced = (-not $env:WGPU_BACKEND) -and (-not $named.ContainsKey('GRAPHICS'))
if ($forced) { $env:WGPU_BACKEND = 'dx12' }

# The game is started in this launcher's own hidden console: started in a
# new one, Windows shows a terminal window beside it.
$gameArgs = $args
function Start-Game {
    if ($gameArgs.Count -gt 0) {
        $run = Start-Process -FilePath $game -WorkingDirectory $here -NoNewWindow -PassThru -ArgumentList $gameArgs
    } else {
        $run = Start-Process -FilePath $game -WorkingDirectory $here -NoNewWindow -PassThru
    }
    if ($run) { $null = $run.Handle }
    return $run
}
# Whether the game closed with an error within ten seconds of starting.
function Died($run) {
    if (-not $run) { return $true }
    if (-not $run.WaitForExit(10000)) { return $false }
    return $run.ExitCode -ne 0
}
# Whether the game started since $since draws on the processor instead of a
# graphics card (its report's first lines say): a card that cannot do
# DirectX 12 leaves only Windows' own slow stand-in, at a frame a second.
function Software-Drawn([datetime]$since) {
    $logs = Join $env:APPDATA 'kjk\logs'
    for ($i = 0; $i -lt 20; $i++) {
        Start-Sleep -Milliseconds 500
        $new = Get-ChildItem -LiteralPath $logs -Directory -ErrorAction SilentlyContinue | Where-Object { $_.CreationTime -ge $since } | Sort-Object CreationTime | Select-Object -Last 1
        if (-not $new) { continue }
        $line = Select-String -LiteralPath (Join $new.FullName 'kjk.log') -Pattern 'AdapterInfo' -ErrorAction SilentlyContinue | Select-Object -First 1
        if ($line) { return [bool]($line.Line -match 'device_type: Cpu|Basic Render Driver') }
    }
    return $false
}
$since = (Get-Date).AddSeconds(-1)
$run = Start-Game
$slow = $forced -and $run -and (Software-Drawn $since)
if ($slow -and -not $run.HasExited) { Stop-Process -Id $run.Id -Force -ErrorAction SilentlyContinue }
if ($slow -or (Died $run)) {
    $again = $false
    if ($forced) {
        # Some PCs cannot start the game on DirectX 12: let it choose.
        Remove-Item Env:WGPU_BACKEND
        $run = Start-Game
        $again = -not (Died $run)
        if ($again) { Save-Path 'GRAPHICS' 'auto' }
    }
    if (-not $again) {
        Tell ("The game closed right after starting.`n`nIts report is in the newest folder here:`n" + (Join $env:APPDATA 'kjk\logs') + "`n`nPlease send the kjk.log file from that folder with your bug report.") 'Warning'
        exit 1
    }
}
exit 0
