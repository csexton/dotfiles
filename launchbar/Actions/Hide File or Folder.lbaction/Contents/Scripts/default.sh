#!/bin/sh
#
# Copyright (c) 2014 Objective Development Software GmbH
# http://www.obdev.at/

# Set "hidden" flag on every file passed:
for file in "$@"
do
    chflags hidden "$file"
done
