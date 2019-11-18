# Script para remover usuario remotamente
# AUTOR  : Ivo Dias 
# VERSAO : 1.0.MSC 

# Recebe o usuario que vai ser removido
$objUser = New-Object System.Security.Principal.NTAccount(Read-Host -Prompt "Informe o usuario: ")

# Busca o SID dentro do usuario e salva em uma variavel
$strSID = $objUser.Translate([System.Security.Principal.SecurityIdentifier])

# Recebemos o hostname do computador onde vamos executar a ação
$hostname = Read-Host "Informe o Hostname ou IP do computador onde vai executar o script: "

# Executamos o procedimento de remoção
Get-WmiObject -ComputerName $hostname win32_userprofile| Where-Object {$_.SID -eq $($strSID.Value)} | ForEach {$_.Delete()} 

# Mostra mensagem de encerramento na tela
Write-Host "O procedimento foi concluido"
pause