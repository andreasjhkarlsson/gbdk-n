echo off
set BIN=..\..\bin
set OBJ=obj

if "%1"=="clean" (
	if exist %OBJ% rd /s/q %OBJ%
	if exist thumby.gb del thumby.gb
	goto end
)

if not exist %OBJ% mkdir %OBJ%
call %BIN%\gbdk-n-compile.bat thumby.c -o %OBJ%\thumby.rel
call %BIN%\gbdk-n-link.bat %OBJ%\thumby.rel -o %OBJ%\thumby.ihx
call %BIN%\gbdk-n-make-rom.bat %OBJ%\thumby.ihx thumby.gb

:end
