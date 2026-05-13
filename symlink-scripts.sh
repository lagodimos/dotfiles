#!/usr/bin/env sh

SCRIPT_DIR=$(
    CDPATH= cd -- "$(dirname -- "$0")" && pwd
)

mkdir -p ~/.local/bin

for script in $SCRIPT_DIR/scripts/*; do
    ln -sf "$script" ~/.local/bin/
done
