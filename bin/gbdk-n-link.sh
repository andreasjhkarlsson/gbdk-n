#!/bin/sh

GBDK_DIR="$( cd "$( dirname "$0" )" && pwd )/.."

set -x
  
sdcc -mgbz80 --no-std-crt0 -I "$GBDK_DIR/include" -I "$GBDK_DIR/include/asm" -L "$GBDK_DIR/lib" "$GBDK_DIR/lib/crt0.rel" -l gb.lib -o a.ihx "$@"
