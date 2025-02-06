#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <target> <depth>"
    exit 1
fi

if ! [[ "$2" =~ ^[0-9]+$ ]]; then
    echo "Error: $2 is not a number"
    exit 1
fi

target=$1
depth=$2

find "$target" -maxdepth "$depth" -type d -name .git -exec bash -c 'cd $1/..;echo update $(pwd);git fetch --all --prune --force --quiet;git checkout develop --quiet;git rebase origin --quiet' bash {} \;
