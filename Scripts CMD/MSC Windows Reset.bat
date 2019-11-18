@echo off
::
================================================================================
:: NOME   : Redefinir Windows 10
:: AUTOR  : Ivo Dias
:: VERSAO : 2.1.MSC
================================================================================
:: Configurações de tela.
echo off
title Redefinir Windows 10.
=================================================================================
:: Redefinir Win
net stop bits
net stop wuauserv
net stop appidsvc
net stop cryptsvc
Del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
::Reinstalar Apps
sc.exe sdset bits D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
sc.exe sdset wuauserv D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)
call :print Renomeando pastas...
Ren %systemroot%\SoftwareDistribution SoftwareDistribution.bak
Ren %systemroot%\system32\catroot2 catroot2.bak
cd /d %windir%\system32
esentutl /d %windir%\softwaredistribution\datastore\datastore.edb
reg delete "HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /f 
reg delete "HKLM\COMPONENTS\PendingXmlIdentifier" /f 
reg delete "HKLM\COMPONENTS\NextQueueEntryIndex" /f 
reg delete "HKLM\COMPONENTS\AdvancedInstallersNeedResolving" /f 
regsvr32.exe atl.dll /s
regsvr32.exe urlmon.dll /s
regsvr32.exe mshtml.dll /s
regsvr32.exe shdocvw.dll /s
regsvr32.exe browseui.dll /s
regsvr32.exe jscript.dll /s
regsvr32.exe vbscript.dll /s
regsvr32.exe scrrun.dll /s
regsvr32.exe msxml.dll /s
regsvr32.exe msxml3.dll /s
regsvr32.exe msxml6.dll /s
regsvr32.exe actxprxy.dll /s
regsvr32.exe softpub.dll /s
regsvr32.exe wintrust.dll /s
regsvr32.exe dssenh.dll /s
regsvr32.exe rsaenh.dll /s
regsvr32.exe gpkcsp.dll /s
regsvr32.exe sccbase.dll /s
regsvr32.exe slbcsp.dll /s
regsvr32.exe cryptdlg.dll /s
regsvr32.exe oleaut32.dll /s
regsvr32.exe ole32.dll /s
regsvr32.exe shell32.dll /s
regsvr32.exe initpki.dll /s
regsvr32.exe wuapi.dll /s
regsvr32.exe wuaueng.dll /s
regsvr32.exe wuaueng1.dll /s
regsvr32.exe wucltui.dll /s
regsvr32.exe wups.dll /s
regsvr32.exe wups2.dll /s
regsvr32.exe wuweb.dll /s
regsvr32.exe qmgr.dll /s
regsvr32.exe qmgrprxy.dll /s
regsvr32.exe wucltux.dll /s
regsvr32.exe muweb.dll /s
regsvr32.exe wuwebv.dll /s
::Ativando serviços
net start bits
net start wuauserv
net start appidsvc
net start cryptsvc
sfc /scannow
:: Encerrando.
cls
color 97
call :print O procedimento foi completado com sucesso.
echo.Reinicie o computador para completar o procedimento
echo.Aperte alguma tecla para encerrar a ferramenta . . .
pause>nul