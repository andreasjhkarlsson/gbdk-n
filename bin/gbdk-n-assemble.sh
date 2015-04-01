#!/bin/sh

GBDK_DIR="$( cd "$( dirname "$0" )" && pwd )/.."

set -x

sdasgb -plosgff "$@"
