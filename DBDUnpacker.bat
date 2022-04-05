@echo off
set version=1.2.0
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
cd "Engine/Binaries/Win64"
if exist "../../../gamepath.txt" (
    set /p path=<"../../../gamepath.txt"
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
echo %path%>"../../../gamepath.txt"
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
if not exist "../../../%platform%" md "../../../%platform%"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk%pakchunkNum%-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
echo Finished unpacking pakchunk%pakchunkNum%-%platform%.pak.
goto :end

:unpackAll
echo Starting unpack.
if not exist "../../../%platform%" md "../../../%platform%"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk0-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk1-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk2-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk3-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk4-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk5-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk6-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk7-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk8-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk9-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk10-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk11-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk12-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk13-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk14-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk15-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk16-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk17-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk18-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk19-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk20-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk21-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk22-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk23-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk24-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk25-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk26-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk27-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk28-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk29-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk30-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk31-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk32-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk33-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk34-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk35-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk36-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk37-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk38-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk39-%platform%.pak" -Extract "../../../%platform%" -extracttomountpoint
echo Finished Unpacking.

:end 
pause