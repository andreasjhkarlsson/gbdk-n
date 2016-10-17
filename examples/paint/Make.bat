echo off
set BIN=..\..\bin
set OBJ=obj

if "%1"=="clean" (
	if exist %OBJ% rd /s/q %OBJ%
	if exist paint.gb del paint.gb
	goto end
)

if not exist %OBJ% mkdir %OBJ%
call %BIN%\gbdk-n-compile.bat paint.c -o %OBJ%\paint.rel
call %BIN%\gbdk-n-link.bat %OBJ%\paint.rel -o %OBJ%\paint.ihx
call %BIN%\gbdk-n-make-rom.bat %OBJ%\paint.ihx paint.gb

:end
