Set-Location 'C:\fivem_server2'
git fetch origin
$local  = (git rev-parse HEAD).Trim()
$remote = (git rev-parse origin/develop).Trim()
if ($local -ne $remote) {
    git reset --hard origin/develop
    git clean -fd
    Write-Output "更新あり → 最新に更新しました"
    # 必要ならFXServer再起動
    # Get-Process FXServer -ErrorAction SilentlyContinue | Stop-Process -Force
    # Start-Process -FilePath 'C:\fivem_server2\server\FXServer.exe'
} else {
    Write-Output "更新なし"
}
