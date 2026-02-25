param(
  [Parameter(Position=0)][ValidateSet("newpages","commitpush")] [string]$Cmd = "newpages",
  [string]$Title = "New pages added",
  [string[]]$Items = @(),
  [switch]$NoCommit
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Die($m){ throw $m }

function New-FileStrict([string]$Path, [string]$Content){
  if (Test-Path $Path) { Die "Append-only violation: file already exists -> $Path" }
  $dir = Split-Path -Parent $Path
  if ($dir -and -not (Test-Path $dir)) { New-Item -ItemType Directory -Force -Path $dir | Out-Null }
  $Content | Out-File -Encoding utf8 -NoNewline $Path
}

function Next-Seq([string]$Stamp){
  $max = 0
  Get-ChildItem INDEX -Filter "MasterIndex.ADDENDUM.$Stamp.*.md" -ErrorAction SilentlyContinue | ForEach-Object {
    if ($_.Name -match "\.(\d{3})\.md$") {
      $n = [int]$Matches[1]
      if ($n -gt $max) { $max = $n }
    }
  }
  return ($max + 1).ToString("000")
}

function Ensure-RepoRoot{
  if (-not (Test-Path ".git")) { Die "Not in repo root (missing .git). cd into the repo root and retry." }
  if (-not (Test-Path "INDEX")) { Die "Missing INDEX folder. Are you in the right repo?" }
}

function CommitPush([string]$Msg){
  git add -A | Out-Null
  $status = git status --porcelain
  if (-not $status) {
    Write-Host "Nothing to commit."
    return
  }
  git commit -m $Msg | Out-Null
  git push | Out-Null
  Write-Host "Committed + pushed: $Msg"
}

function Build-AddendumContent([string]$Heading, [string[]]$Lines){
  $body = $Lines | ForEach-Object { "- $_" } | Out-String
  return "# $Heading`r`n`r`nAdded:`r`n$body"
}

Ensure-RepoRoot
cls

$stamp = Get-Date -Format "yyyyMMdd"
$seq   = Next-Seq -Stamp $stamp

switch ($Cmd) {
  "newpages" {
    if (-not $Items -or $Items.Count -eq 0) {
      Die "No -Items provided. Example: .\tools\codex.ps1 newpages -Title ""New pages"" -Items ""ID → path"", ""ID2 → path2"""
    }

    $miPath = "INDEX\MasterIndex.ADDENDUM.$stamp.$seq.md"
    $idPath = "INDEX\IdRegistry.ADDENDUM.$stamp.$seq.md"
    $chDir  = "CHANGELOGS"
    $chPath = "$chDir\CHANGELOG.ADDENDUM.$stamp.$seq.md"

    $mi = Build-AddendumContent "MasterIndex.ADDENDUM.$stamp.$seq — $Title" $Items
    New-FileStrict $miPath $mi

    # Make an IdRegistry table if items look like "ID → path"
    $rows = @()
    foreach ($it in $Items) {
      $id = $it
      $file = ""
      if ($it -match "^\s*([^→]+?)\s*→\s*(.+?)\s*$") {
        $id = $Matches[1].Trim()
        $file = $Matches[2].Trim()
      }
      $rows += "| $id | ? | ? | ? | $file | ____ |"
    }
    $idContent = @"
# IdRegistry.ADDENDUM.$stamp.$seq — New IDs logged

| ID | Type (E/C) | Scope | Title | File | First Written (Journal/Page) |
|---|---|---|---|---|---|
$($rows -join "`r`n")
"@
    New-FileStrict $idPath $idContent

    New-Item -ItemType Directory -Force -Path $chDir | Out-Null
    $today = Get-Date -Format "yyyy-MM-dd"
    $ch = @"
# CHANGELOG.ADDENDUM.$stamp.$seq

- ${today}: $Title
"@
    New-FileStrict $chPath $ch

    Write-Host "Wrote:"
    Write-Host " - $miPath"
    Write-Host " - $idPath"
    Write-Host " - $chPath"

    if (-not $NoCommit) {
      CommitPush "codex: add addendums ($stamp.$seq)"
    } else {
      Write-Host "NoCommit set; skipping git commit/push."
    }
  }

  "commitpush" {
    CommitPush "codex: update ($stamp.$seq)"
  }
}

