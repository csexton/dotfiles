#!/bin/zsh
if [ -f ~/.profile ] ; then
  source ~/.profile
fi
/Applications/MacVim.app/Contents/bin/mvim /tmp/scratch-$RANDOM.md &
exit 0

