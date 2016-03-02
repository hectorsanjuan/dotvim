# VIM config

This is my current VIM config. I use pathogen plugin to manage other
and use git submodules to track last versions.

## Install

First of all you must create backup of your current vim configuration:

    $ cd ~
    $ cp .vimrc vimrc.old
    $ mv .vim vim.old

In order to use this vim config on *nix machine you must have installed vim, git
and exhuberant ctags.

The vim version must be at least 7.4 and musth have +signs and +python. You can
check vim options from vim with `:has('python')` or from command line with
`vim --version`.

You have to clone this repository:

    $ git clone --recursive https://github.com/hectorsanjuan/dotvim.git ~/.vim

Then you have to create symlinks to vim config file:

    $ ln -s ~/.vim/vimrc ~/.vimrc
