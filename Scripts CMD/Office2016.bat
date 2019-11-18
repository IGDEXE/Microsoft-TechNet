@echo off  
================================================================================  
:: NOME   : Ativar o Office 2016 
:: AUTOR  : Ivo Dias  
:: VERSAO : 1.0.MSC 
================================================================================
::Titulo:
title Ativar o Office 2016

:: Recebe o hostname
set /p Hostname="Informe o hostname: "

:: Acessa a pasta do Office e atualiza as licenças
psexec \\%Hostname% -s cmd /c cscript "C:\Program Files (x86)\Microsoft Office\Office16\OSPP.VBS" /rearm

:: Ativa o Office
psexec \\%Hostname% -s cmd /c cscript "C:\Program Files (x86)\Microsoft Office\Office16\OSPP.VBS" /act 

::Finalizando
color 27
echo "Procedimento finalizado, favor verificar o resultado dos comandos acima"
Pause