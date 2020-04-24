@rem œÓƒø”√vs2005±‡“Î
@echo off
IF exist "c:\Program Files (x86)" (set v=0) ELSE (set v=1)
set ROOT=Program Files (x86)
IF %v%==1 (set ROOT=Program Files)
set PATH=C:\%ROOT%\Microsoft Visual Studio 8\VC\bin;C:\%ROOT%\Microsoft Visual Studio 8\Common7\IDE;
set INCLUDE=C:\%ROOT%\Microsoft Visual Studio 8\VC\include;C:\%ROOT%\Microsoft Visual Studio 8\VC\PlatformSDK\Include;
set LIB=C:\%ROOT%\Microsoft Visual Studio 8\VC\lib\;C:\%ROOT%\Microsoft Visual Studio 8\VC\PlatformSDK\Lib;