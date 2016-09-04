echo off
set BIN=..\..\bin
set OBJ=obj

if "%1"=="clean" (
	if exist %OBJ% rd /s/q %OBJ%
	if exist space.gb del space.gb
	goto end
)

if not exist %OBJ% mkdir %OBJ%
call %BIN%\gbdk-n-assemble.bat %OBJ%\space.rel space.s 
call %BIN%\gbdk-n-link.bat %OBJ%\space.rel -o %OBJ%\space.ihx
call %BIN%\gbdk-n-make-rom.bat %OBJ%\space.ihx space.gb

:end
