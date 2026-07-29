$ErrorActionPreference = "Stop"

Write-Host "Configurador do README animado - Nicholas Gil" -ForegroundColor Cyan
$username = Read-Host "Seu usuario exato no GitHub"
$linkedin = Read-Host "URL completa do LinkedIn (ou deixe vazio)"
$instagram = Read-Host "URL completa do Instagram (ou deixe vazio)"
$email = Read-Host "Seu e-mail publico (ou deixe vazio)"

if ([string]::IsNullOrWhiteSpace($username)) {
  throw "O usuario do GitHub e obrigatorio."
}
if ([string]::IsNullOrWhiteSpace($linkedin)) { $linkedin = "https://github.com/$username" }
if ([string]::IsNullOrWhiteSpace($instagram)) { $instagram = "https://github.com/$username" }
if ([string]::IsNullOrWhiteSpace($email)) { $email = "contato@example.com" }

$replacements = @{
  "SEU_USUARIO_GITHUB" = $username
  "SEU_LINKEDIN" = $linkedin
  "SEU_INSTAGRAM" = $instagram
  "SEU_EMAIL" = $email
}

$extensions = @(".md", ".yml", ".yaml", ".svg", ".sh", ".ps1")
Get-ChildItem -Path $PSScriptRoot -Recurse -File |
  Where-Object { $extensions -contains $_.Extension -and $_.FullName -notmatch "\\.git\\" } |
  ForEach-Object {
    $content = Get-Content $_.FullName -Raw -Encoding UTF8
    foreach ($key in $replacements.Keys) {
      $content = $content.Replace($key, $replacements[$key])
    }
    Set-Content $_.FullName $content -Encoding UTF8
  }

Write-Host "Configuracao concluida." -ForegroundColor Green
Write-Host "Agora copie os arquivos para o repositorio $username/$username e envie para a branch main."
