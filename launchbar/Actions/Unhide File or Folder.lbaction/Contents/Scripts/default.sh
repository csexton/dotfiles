#!/bin/sh
#
# Copyright (c) 2014 Objective Development Software GmbH
# http://www.obdev.at/

# Clear "hidden" flag on every file passed:
for file in "$@"
do
    chflags nohidden "$file"
done
