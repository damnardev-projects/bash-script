#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <target>"
    exit 1
fi

target=$1

cd $1
echo "clean directory $(pwd)"
git clean -dfX	
