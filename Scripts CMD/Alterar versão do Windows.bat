@echo off
::
================================================================================
:: NOME   : Alterar a versão do Windows
:: AUTOR  : Ivo "Sir Ti_Rex" Dias
:: VERSAO : 1.0
::
================================================================================

:: Configurações de tela.
:mode

echo off
title Alterar a versão do Windows
color 2

goto permission
::
=================================================================================

:: Escrever no alto da tela.
::
=================================================================================
:print
cls
echo.
echo.Alterar a versão do Windows
echo.
echo.%*
echo.

goto :eof
::
=================================================================================

:: Verificando permissão de Administrador.
::
=================================================================================
:permission
openfiles>nul 2>&1
 
if %errorlevel% EQU 0 goto terms
 
call :print Verique se executou o programa como Administrador.

echo.    Voce nao executou como Administrador.
echo.    Essa ferramenta nao vai ser efetiva sem isso.
echo.
echo.    Aperte com o botao direito e selecione Executar como Administrador.
echo.
echo.Aperte alguma tecla para continuar. . .
pause>nul
goto :eof

::
=================================================================================

:: Termos.
::
=================================================================================
:terms
call :print Termos de uso.

echo.    Essa ferramenta modifica arquivos e o registro do sistema.
echo.    Nao nos responsabilizamos pelo uso da ferramenta, em caso de duvidas
echo.    seguir as orientacoes na pagina da Microsoft.
echo.    Voce eh livre para aprimorar esse codigo.
echo.

choice /c YN /n /m "Voce deseja continuar? (Sim[Y]/Nao[N]) "
if %errorlevel% EQU 1 goto Menu
if %errorlevel% EQU 2 goto Close

echo.
echo.Um erro ocorreu.
echo.
echo.Aperte alguma tecla para continuar . . .
pause>nul
goto :eof

::
=================================================================================
:: Menu de ferramentas.
:: /*************************************************************************************/
:Menu
call :print Menu.

echo.     1. Windows 8 Single Language
echo.     2. Windows 8
echo.     3. Windows 10 Home Single Language
echo.     4. Windows 10 Home
echo.     5. Encerrar
echo.

set /p option=Escolha uma opcao: 

if %option% EQU 1 (
    call :W8SL
) else if %option% EQU 2 (
    call :W8
) else if %option% EQU 3 (
    call :W10HSL
) else if %option% EQU 4 (
    call :W10H
) else if %option% EQU 5 (
    goto Close
) else (
    echo.
    echo.Opcao invalida.
    echo.
    echo.Aperte alguma tecla para continuar . . .
    pause>nul
)

goto Menu
:: /*************************************************************************************/


:: Windows 10 Home Single Language
:W10HSL
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 10 Home Single Language" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d CoreSingleLanguage /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 10 Home Single Language" /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d CoreSingleLanguage /f
goto END

:: Windows 10 Home
:W10H
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 10 Home" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d Core /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 10 Home" /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d Core /f
goto END

:: Windows 8 Single Language
:W8SL
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 8.1 Single Language" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d CoreSingleLanguage /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 8.1 Single Language" /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d CoreSingleLanguage /f
goto END

:: Windows 8
:W8
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 8.1" /f
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d Core /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "ProductName" /t REG_SZ /d "Windows 8.1" /f
REG ADD "HKLM\Software\Wow6432Node\Microsoft\Windows NT\CurrentVersion" /v "EditionID" /t REG_SZ /d Core /f
goto END

:: Encerrando.
:END
call :print O procedimento foi completado com sucesso.
echo.Aperte alguma tecla para encerrar . . .
pause>nul
goto :eof


