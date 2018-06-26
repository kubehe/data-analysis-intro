#!/usr/bin/env bash

[ ! -z "$1" ] && arg=$1 || arg="main.m"

matlab -display :0.0 -nosplash -nodisplay -r "try, run('./src/${arg}'), catch e,  fprintf(1,'The identifier was:\n%s',e.identifier),  fprintf(1,'There was an error! The message was:\n%s',e.message), exit(1), end, exit(0);"
echo "matlab return: $?"
