set GBDK_DIR=%~dp0..

sdcc -mgbz80 --no-std-crt0 -I "%GBDK_DIR%\include" -I "%GBDK_DIR%\include\asm" -c %*