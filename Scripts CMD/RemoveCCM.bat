@echo off  
================================================================================  
:: NOME   : Remover o SCCM offline
:: AUTOR  : Ivo Dias  
:: VERSAO : 1.1.MSC 
================================================================================
::Titulo:
title MSC_IT Support - Remover o SCCM offline

:: Parando os serviços do SCCM
echo Parando os serviços do SCCM
net stop CcmExec

:: Remove o SCCM
echo Removendo o SCCM 
c:\temp\ccmsetup.exe /uninstall
:: Mostra mensagem quando completar
echo Remoção concluida

:: Aguarda
ping 127.0.0.1 -n 60 > nul

:: Removendo pastas
echo Removendo pastas e arquivos 
rd c:\windows\ccm /s /q
rd c:\windows\system32\ccm /s /q
rd c:\windows\ccmcache /s /q
rd c:\windows\system32\ccmcache /s /q
rd d:\ESDCache\SMS\ccmcache /s /q
rd c:\windows\ccmsetup /s /q
rd c:\windows\system32\ccmsetup /s /q
del c:\windows\smscfg.ini
del c:\windows\System32\smscfg.ini
echo Remoção concluida

:: Removendo as chaves de registro
echo Removendo as chaves de registro
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\CCM" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\CCMSetup" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SMS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\SystemCertificates\SMS\Certificates" /f

:: Aguarda
ping 127.0.0.1 -n 60 > nul
echo Chaves removidas

::Finalizando
color 27
echo "Procedimento concluido com sucesso"
Pause