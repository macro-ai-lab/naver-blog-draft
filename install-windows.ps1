$ErrorActionPreference = 'Stop'
if ([Environment]::OSVersion.Platform -ne [PlatformID]::Win32NT) { throw '이 설치기는 Windows용입니다.' }
$Source = Join-Path $PSScriptRoot 'naver-blog-draft'
if (-not (Test-Path -LiteralPath (Join-Path $Source 'SKILL.md'))) { throw 'ZIP을 완전히 압축 해제한 뒤 다시 실행하세요.' }
$Base = $env:CODEX_HOME
if (-not $Base) { $Base = Join-Path $env:USERPROFILE '.codex' }
$Skills = Join-Path $Base 'skills'
$Target = Join-Path $Skills 'naver-blog-draft'
[IO.Directory]::CreateDirectory($Skills) | Out-Null
$Stage = $null
$LockStream = $null
$LockPath = Join-Path $Skills '.naver-blog-draft-install.lock'
try {
    $LockStream = [IO.File]::Open($LockPath, [IO.FileMode]::OpenOrCreate, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
    if (Test-Path -LiteralPath $Target) {
        if ((Get-Item -LiteralPath $Target).Attributes -band [IO.FileAttributes]::ReparsePoint) { throw '설치 위치가 링크입니다. Codex에 확인을 요청하세요.' }
        $Files = @(Get-ChildItem -LiteralPath $Source -File -Recurse -Force)
        $ExistingFiles = @(Get-ChildItem -LiteralPath $Target -File -Recurse -Force)
        if ($Files.Count -ne $ExistingFiles.Count) { throw '다른 버전 또는 수정본이 있어 덮어쓰지 않았습니다. Codex에 갱신을 요청하세요.' }
        foreach ($File in $Files) {
            $Relative = $File.FullName.Substring($Source.Length + 1)
            $Existing = Join-Path $Target $Relative
            if (-not (Test-Path -LiteralPath $Existing -PathType Leaf) -or (Get-FileHash -LiteralPath $Existing).Hash -ne (Get-FileHash -LiteralPath $File.FullName).Hash) {
                throw '다른 버전 또는 수정본이 있어 덮어쓰지 않았습니다. Codex에 갱신을 요청하세요.'
            }
        }
        Write-Host '같은 스킬이 이미 설치되어 있습니다. 새 Codex 채팅에서 사용하세요.'
    }
    else {
        $Stage = Join-Path $Skills ('.naver-blog-draft-install-' + [Guid]::NewGuid().ToString('N'))
        [IO.Directory]::CreateDirectory($Stage) | Out-Null
        foreach ($Entry in (Get-ChildItem -LiteralPath $Source -Force)) { Copy-Item -LiteralPath $Entry.FullName -Destination $Stage -Recurse -Force }
        [IO.Directory]::Move($Stage, $Target)
        $Stage = $null
        Write-Host '네이버 블로그 스킬 설치 완료! 새 Codex 채팅에서 사용하세요.'
    }
}
finally {
    if ($Stage -and (Test-Path -LiteralPath $Stage)) { Remove-Item -LiteralPath $Stage -Recurse -Force }
    if ($LockStream) { $LockStream.Dispose() }
}
