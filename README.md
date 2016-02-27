# VIM config

This is my current VIM config. I use pathogen plugin to manage other
and use git submodules to track last versions.

## Install

First of all you must create backup of your current vim configuration:

    $ cd ~
    $ cp .vimrc vimrc.old
    $ mv .vim vim.old

In order to use this vim config on *nix machine you must have installed git and exhuberant ctags.

You have to clone this repository:

    $ git clone --recursive https://github.com/rincewind1981/vim-config.git ~/.vim

Then you have to create symlinks to vim config file:

    $ ln -s ~/.vim/vimrc ~/.vimrc
