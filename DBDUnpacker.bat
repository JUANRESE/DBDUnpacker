@echo off
title Dead by Daylight Unpacker (1.0.0)
echo  ___  ___ ___    _   _                    _           
echo ^|   \^| _ )   \  ^| ^| ^| ^|_ _  _ __  __ _ __^| ^|_____ _ _ 
echo ^| ^|) ^| _ \ ^|) ^| ^| ^|_^| ^| ' \^| '_ \/ _` / _^| / / -_) '_^|
echo ^|___/^|___/___/   \___/^|_^|^|_^| .__/\__,_\__^|_\_\___^|_^|  
echo                            ^|_^|                        
echo.
echo Dead by Daylight Unpacker (1.0.0)
echo By BrandonItaly#0495
echo.
cd UnrealPakTool
:: Default path set to C Drive.
if exist ../gamepath.txt set /p path=<../gamepath.txt
if not exist ../gamepath.txt set path=C:\Program Files (x86)\Steam\steamapps\common\Dead by Daylight
:retry
echo Is this where Dead by Daylight is installed? %path% [Y/N]
set /P choice=
if /I "%choice%" EQU "N" goto :dbdlocation
if /I "%choice%" EQU "NO" goto :dbdlocation
if /I "%choice%" EQU "Y" goto :platform
if /I "%choice%" EQU "YES" goto :platform
echo "%choice%" is not valid, try again.
goto :retry
::If user chooses N they manually enter a directory where DBD is installed.
:dbdlocation
echo Please set your directory below.
set /p path=

:platform
if exist "%path%/DeadByDaylight/Content/Paks/pakchunk0-EGS.pak" set platform=EGS
if exist "%path%/DeadByDaylight/Content/Paks/pakchunk0-WinGDK.pak" set platform=WinGDK
if exist "%path%/DeadByDaylight/Content/Paks/pakchunk0-WindowsNoEditor.pak" set platform=WindowsNoEditor
md %platform%

:start
echo [1]. Unpack Single Pak
echo [2]. Unpack All Paks
echo.
set unpackChoice=
set /p unpackChoice=Select an option: 
if not '%unpackChoice%'=='' set unpackChoice=%unpackChoice:~0,1%
if '%unpackChoice%'=='1' goto unpackSingle
if '%unpackChoice%'=='2' goto unpackAll
echo "%unpackChoice%" is not valid, try again.
echo.
goto start

:unpackSingle
::Extract Single Pak with UnrealPak.
set /p pakchunkNum=Pak Chunk ID: 
echo Unpacking pakchunk%pakchunkNum%-%platform%.pak.
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk%pakchunkNum%-%platform%.pak" -Extract "../%platform%"
echo Finished unpacking pakchunk%pakchunkNum%-%platform%.pak.
goto end

:unpackAll
::Extract Paks 0-39 with UnrealPak.
echo Starting unpack.
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk0-%platform%.pak" -Extract "../%platform%"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk1-%platform%.pak" -Extract "../%platform%"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk2-%platform%.pak" -Extract "../%platform%\DeadByDaylight"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk3-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk4-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk5-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk6-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk7-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk8-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk9-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk10-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers\Claudette"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk11-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk12-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers\Dwight"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk13-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers\Jake"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk14-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk15-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers\Meg"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk16-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers\Nea"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk17-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk18-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Campers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk19-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Slashers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk20-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Slashers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk21-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Slashers\Nurse"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk22-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Slashers\Trapper"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk23-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Slashers\Wraith"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk24-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters\Slashers"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk25-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Characters"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk26-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Effects"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk27-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Materials"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk28-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Meshes\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk29-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Meshes\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk30-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Meshes\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk31-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Meshes\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk32-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Meshes"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk33-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Textures\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk34-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Textures\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk35-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Textures\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk36-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Textures\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk37-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Textures\Environment"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk38-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content\Textures"
UnrealPak "%path%/DeadByDaylight/Content/Paks/pakchunk39-%platform%.pak" -Extract "../%platform%\DeadByDaylight\Content"
echo Finished Unpacking.

:end 
pause