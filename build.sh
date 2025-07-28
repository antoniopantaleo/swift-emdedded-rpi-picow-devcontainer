#!/bin/bash

set -e

cmake -B build -G Ninja . -DCMAKE_EXPORT_COMPILE_COMMANDS=On
cmake --build build
ln -s build/*.uf2 .