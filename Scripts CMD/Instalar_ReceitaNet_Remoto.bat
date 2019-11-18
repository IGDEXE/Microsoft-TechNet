@echo off  
================================================================================  
:: NOME   : Instalar Receita Net
:: AUTOR  : Ivo Dias  
:: VERSAO : 1.0.MSC 
================================================================================
::Titulo:
title Receita Net

:: Recebe o hostname
set /p Hostname="Informe o hostname: "

:: Faz a copia do arquivo e cria o log de erro
:: O arquivo precisa estar dentro dessa estrutura de pasta "C:\temp\Remote_Fiscal\Software"
robocopy  C:\Remote_Fiscal\ReceitaNet \\%Hostname%\c$\Temp\ "Receitanet.exe" /R:3 /W:10 /J /V /ETA /TEE /LOG:C:\%Hostname%.log

:: Inicia a instalação remota
echo Inicia a instacao no computador %Hostname%
psexec \\%Hostname% -s cmd /c C:\temp\Receitanet.exe /s
echo Finalizado o processo de instacao no computador %Hostname%

::Finalizando
color 27
echo "O script foi executado"
Pause
