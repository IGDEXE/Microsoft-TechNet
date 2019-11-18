# Generate a password as a hash file
# Ivo Dias

Clear-Host
Write-Host "Convert password to secure file"
try {
    # Recebe as informacoes necessarias
    $caminhoArquivo = Read-Host "Enter the file path"
    $hash = Get-Date -Format SEC@ddMMyyyyssmm # Cria um identificador com base no dia e hora
    # Gera a chave
    $KeyFile = "$caminhoArquivo\$hash.key" # Define o caminho do arquivo
    $Key = New-Object Byte[] 32   # Voce pode usar 16 (128-bit), 24 (192-bit), ou 32 (256-bit) para AES
    [Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($Key) # Cria a chave de criptografia
    $Key | Out-File $KeyFile # Salva em um arquivo
    # Gera a senha
    Read-Host "Enter your Password" -AsSecureString | ConvertFrom-SecureString -key $Key | Out-File "$caminhoArquivo\$hash.pass" # Gera a senha
    Write-Host "Files availible in: $caminhoArquivo"
}
catch {
    $ErrorMessage = $_.Exception.Message # Recebe a mensagem de erro
    Write-Host "Error: $ErrorMessage"
}
Pause