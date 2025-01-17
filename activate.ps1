$Folder = "./venv/"

if (-Not (Test-Path -Path $Folder)) { 
  Write-Host "Criando ambiente virtual..."
  python -m venv venv | Out-Null
}

Write-Host "Instalando as dependências..."
./venv/Scripts/pip install -r requirements.txt | Out-Null

$File = "./refreship.bat"
$BinFolder = "./bin/"

if (-Not (Test-Path -Path $BinFolder)) {
  New-Item -Path "./" -Name "bin" -ItemType "directory" | Out-Null
}

if (-Not (Test-Path -Path $File -PathType leaf)) {
  Write-Host "Criando arquivo de inicialização..."
  "../venv/Scripts/python ../src/refreship.py" | Out-File -FilePath "./bin/refreship.ps1"
}