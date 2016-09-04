echo off

set SRCDIR=libc
set OBJDIR=obj
set LIBDIR=lib

set CC=bin\gbdk-n-compile.bat
set CA=bin\gbdk-n-assemble.bat

:: Build examples
if "%1"=="examples" (
	cd examples
	echo Building: galaxy && cd galaxy && call Make.bat
	echo. && echo Building: paint && cd ../paint && call Make.bat
	echo. && echo Building: space && cd ../space && call Make.bat
	echo. && echo Building: thumby && cd ../thumby && call Make.bat
	cd ..\..
	goto end
)

:: Clean libc + examples
if "%1"=="clean" (
	echo Cleaning: libc

	if exist %OBJDIR% rd /s/q %OBJDIR%
	if exist %LIBDIR% rd /s/q %LIBDIR%
	
	cd examples
	echo Cleaning: galaxy && cd galaxy && call Make.bat clean
	echo Cleaning: paint && cd ..\paint && call Make.bat clean
	echo Cleaning: space && cd ..\space && call Make.bat clean
	echo Cleaning: thumby && cd ..\thumby && call Make.bat clean
	cd ..\..
	echo.
	goto end
)

:: Build libc sources
if not exist %OBJDIR% md %OBJDIR%

echo Building gb.lib && echo.

for %%A in (%SRCDIR%\*.c) do (
	if exist %OBJDIR%\%%~nA.rel del %OBJDIR%\%%~nA.rel
	echo Compiling: %%~nxA && call %CC% %SRCDIR%\%%~nA.c -o %OBJDIR%\%%~nA.rel
	if not exist %OBJDIR%\%%~nA.rel echo. && echo Build failed! && echo. && pause && goto end
)
for %%A in (%SRCDIR%\*.s) do (
	if exist %OBJDIR%\%%~nA.rel del %OBJDIR%\%%~nA.rel
	echo Assembling: %%~nxA && call %CA% %OBJDIR%\%%~nA.rel %SRCDIR%\%%~nA.s
	if not exist %OBJDIR%\%%~nA.rel echo. && echo Build failed! && echo. && pause && goto end
)

if not exist %LIBDIR% md %LIBDIR%
if exist %LIBDIR%\crt0.rel del %LIBDIR%\crt0.rel
copy /b/v/y %OBJDIR%\crt0.rel %LIBDIR%\crt0.rel

:: Write list of inputs for the library
if exist %OBJDIR%\rels.txt del %OBJDIR%\rels.txt
for %%A in (%OBJDIR%\*.rel) do (
	echo %%A >> %OBJDIR%\rels.txt
)

sdcclib -l %LIBDIR%\gb.lib %OBJDIR%\rels.txt	

echo.
if not exist %LIBDIR%\gb.lib (
	echo Build failed!
) else (
	echo Build succeeded!
)
echo.

:end