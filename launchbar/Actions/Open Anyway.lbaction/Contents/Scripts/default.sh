#!/bin/sh
#
# Copyright (c) 2014 Objective Development Software GmbH
# http://www.obdev.at/

# Clear quarantine flag on every file passed, then open it:
for f in "$@"
do
	xattr -d com.apple.quarantine "$f"
	open "$f"
done
