echo off
set BIN=..\..\bin
set OBJ=obj

if "%1"=="clean" (
	if exist %OBJ% rd /s/q %OBJ%
	if exist galaxy.gb del galaxy.gb
	goto end
)

if not exist %OBJ% mkdir %OBJ%
call %BIN%\gbdk-n-compile.bat galaxy.c -o %OBJ%\galaxy.rel
call %BIN%\gbdk-n-link.bat %OBJ%\galaxy.rel -o %OBJ%\galaxy.ihx
call %BIN%\gbdk-n-make-rom.bat %OBJ%\galaxy.ihx galaxy.gb

:end
