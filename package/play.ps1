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

function Say([string]$text) { Write-Host $text }
function Stop-With([string[]]$lines) {
    Say ''
    Say 'KOTOR Academy cannot start yet.'
    Say ''
    foreach ($line in $lines) { Say $line }
    Say ''
    Say 'See README for the full install steps.'
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
        Say ''
        Say "That folder does not look like $what (no $marker in it). Try again, or press Cancel."
    }
}

function Ask-Yes([string]$question) {
    $answer = Read-Host "$question (Y/N)"
    return $answer -match '^\s*y'
}

$kotor1Marker = 'swkotor.exe'
$kotor2Marker = 'swkotor2.exe'
$academyMarker = 'GameData\base\assets0.pk3'
$kotor1 = Find-Game 'KOTOR1' 'swkotor' 'Knights of the Old Republic(?!.*(II|2|Sith Lords))' @('GOG Games\Star Wars - KotOR', 'Program Files (x86)\GOG Galaxy\Games\Star Wars - KotOR', 'Program Files (x86)\LucasArts\SWKotOR') $kotor1Marker
$kotor2 = Find-Game 'KOTOR2' 'Knights of the Old Republic II' 'Knights of the Old Republic.*(II|2|Sith Lords)' @('GOG Games\Star Wars - KotOR2', 'Program Files (x86)\GOG Galaxy\Games\Star Wars - KotOR2', 'Program Files (x86)\LucasArts\SWKotOR2') $kotor2Marker
$academy = Find-Game 'JEDIACADEMY' 'Jedi Academy' 'Jedi Academy' @('GOG Games\Star Wars Jedi Knight - Jedi Academy', 'Program Files (x86)\GOG Galaxy\Games\Star Wars Jedi Knight - Jedi Academy', 'Program Files (x86)\LucasArts\Star Wars Jedi Knight Jedi Academy') $academyMarker

# Not found by itself: the player points at it, once.
if (-not $kotor1 -and -not $kotor2) {
    Say ''
    Say 'Knights of the Old Republic was not found on this PC.'
    if (Ask-Yes 'Is KOTOR I installed? Choose its folder now') {
        $kotor1 = Ask-Folder 'Knights of the Old Republic' $kotor1Marker
        if ($kotor1) { Save-Path 'KOTOR1' $kotor1 }
    }
    if (-not $kotor1 -and (Ask-Yes 'Is KOTOR II installed? Choose its folder now')) {
        $kotor2 = Ask-Folder 'Knights of the Old Republic II' $kotor2Marker
        if ($kotor2) { Save-Path 'KOTOR2' $kotor2 }
    }
}
if (-not $academy) {
    Say ''
    Say 'Jedi Knight: Jedi Academy was not found on this PC.'
    if (Ask-Yes 'Is it installed? Choose its folder now') {
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
    Say ''
    Say 'Movie Duels was not found beside Jedi Academy.'
    if (Ask-Yes 'Is Movie Duels installed somewhere else? Choose its folder now') {
        $picked = Ask-Folder 'Movie Duels (the folder holding MD_Assets2.pk3)' 'MD_Assets2.pk3'
        if ($picked) { Save-Path 'MOVIEDUELS' $picked; $duels = Find-Duels }
    }
}

$missing = New-Object System.Collections.Generic.List[string]
if (-not $kotor1 -and -not $kotor2) {
    $missing.Add('- Star Wars: Knights of the Old Republic or Knights of the Old Republic II is needed.')
    $missing.Add('  Install at least one of them.')
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
$env:KJK_JA = $academy
$env:KJK_MOVIEDUELS = $duels

# Optional: loose KOTOR I mod files (textures, models) in the mods folder.
$mods = Join $here 'mods'
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

Say 'Starting KOTOR Academy...'
if ($kotor1) { Say "  KOTOR I:      $kotor1" }
if ($kotor2) { Say "  KOTOR II:     $kotor2" }
Say "  Jedi Academy: $academy"
Say "  Movie Duels:  $duels"
if ($args.Count -gt 0) {
    Start-Process -FilePath $game -WorkingDirectory $here -ArgumentList $args
} else {
    Start-Process -FilePath $game -WorkingDirectory $here
}
exit 0
