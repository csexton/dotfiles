** I am easily satisfied with the very best.** --Winston Churchill

# Chris's Dot Files

To install download or clone the project to where you would like to store it.  I keep things in ~/.dotfiles, for fun.

    git clone http://github.com/csexton/dotfiles.git ~/.dotfiles
    cd ~/.dotfiles
    git submodule init
    git submodule update
    rake home

# Vim configuration

Everything should be ready to go except for the [command-t](http://github.com/wincent/Command-T) plugin, if you want that to work you will have to build the C extension.

    cd ~/.dotfiles/vim/bundle/command-t/ruby/command-t
    ruby extconf.rb && make && make install

