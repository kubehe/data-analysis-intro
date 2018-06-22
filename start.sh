#!/usr/bin/env bash

matlab -nodisplay -nojvm -nosplash -nodesktop -r "try, run('./src/main.m'), catch, exit(0), end, exit(0);"
