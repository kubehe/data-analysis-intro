#!/usr/bin/env bash

matlab -display :0.0 -nosplash -nodisplay -r "try, run('./src/main.m'), catch, exit(1), end, exit(0);"
echo "matlab return: $?"
