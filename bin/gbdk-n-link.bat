set GBDK_DIR=%~dp0..
  
sdcc -mgbz80 --no-std-crt0 --data-loc 0xc0a0 -I "%GBDK_DIR%\include" -I "%GBDK_DIR%\include\asm" -L "%GBDK_DIR%\lib" "%GBDK_DIR%\lib\crt0.rel" -l gb.lib -o a.ihx %*
