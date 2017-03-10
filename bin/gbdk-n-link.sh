#!/bin/sh

GBDK_DIR="$( cd "$( dirname "$0" )" && pwd )/.."

set -x
  
sdcc -mgbz80 --no-std-crt0 --data-loc 0xc0a0 -L "$GBDK_DIR/lib" "$GBDK_DIR/lib/crt0.rel" gb.lib -o a.ihx "$@"
