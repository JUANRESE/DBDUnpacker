@echo off
set version=1.2.1
set pwsh=%SYSTEMROOT%\System32\WindowsPowerShell\v1.0\powershell.exe -Command
title Dead by Daylight Unpacker (%version%)
echo  ___  ___ ___    _   _                    _           
echo ^|   \^| _ )   \  ^| ^| ^| ^|_ _  _ __  __ _ __^| ^|_____ _ _ 
echo ^| ^|) ^| _ \ ^|) ^| ^| ^|_^| ^| ' \^| '_ \/ _` / _^| / / -_) '_^|
echo ^|___/^|___/___/   \___/^|_^|^|_^| .__/\__,_\__^|_\_\___^|_^|  
echo                            ^|_^|                        
echo.
echo Dead by Daylight Unpacker (%version%)
echo By BrandonItaly#0495
echo.
if exist gamepath.txt (
    set /p path=<gamepath.txt
    goto :start
) else goto :paths
:paths
set path=C:\Program Files (x86)\Steam\steamapps\common\Dead by Daylight
echo Is this where DBD is installed? %path% [Y/N]
set /p installPath=
if /i '%installPath%'=='Y' goto :start
if /i '%installPath%'=='YES' goto :start
if /i '%installPath%'=='N' goto :dbdlocation
if /i '%installPath%'=='NO' goto :dbdlocation
echo "%installPath%" is not valid, try again.
goto :paths
:dbdlocation
echo Please set your directory below.
set /p path=
goto :start
:platformCheck
if exist "%path%/DeadByDaylight/Content/Paks/pakchunk0-WindowsNoEditor.pak" set platform=WindowsNoEditor
if exist "%path%/DeadByDaylight/Content/Paks/pakchunk0-WinGDK.pak" set platform=WinGDK
if exist "%path%/DeadByDaylight/Content/Paks/pakchunk0-EGS.pak" set platform=EGS
goto :eof

:start
echo %path%>gamepath.txt
call :platformCheck
echo [1]. Unpack Single Pak
echo [2]. Unpack All Paks
echo.
set unpackChoice=
set /p unpackChoice="Select an option: "
if not '%unpackChoice%'=='' set unpackChoice=%unpackChoice:~0,1%
if '%unpackChoice%'=='1' goto :unpackSingle
if '%unpackChoice%'=='2' goto :unpackAll
echo "%unpackChoice%" is not valid, try again.
echo.
goto :start

:unpackSingle
set /p pakchunkNum=Pak Chunk ID: 
echo Unpacking pakchunk%pakchunkNum%-%platform%.pak.
if not exist "%platform%" md "%platform%"
Engine\Binaries\Win64\UnrealPak.exe "%path%/DeadByDaylight/Content/Paks/pakchunk%pakchunkNum%-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
echo Finished unpacking pakchunk%pakchunkNum%-%platform%.pak.
goto :end

:unpackAll
echo Starting unpack.
if not exist "%platform%" md "%platform%"
%pwsh% "& {Get-ChildItem -Path '%path%\DeadByDaylight\Content\Paks\*' -Include *.pak | Select-Object -exp FullName | ForEach-Object { Engine\Binaries\Win64\UnrealPak.exe $_ -Extract '../../../%platform%' -extracttomountpoint } }"
echo Finished Unpacking.

:end 
pause