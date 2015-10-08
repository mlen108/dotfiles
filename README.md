Dotfiles
========

dotfiles inspired by [Adam Georgeson's dotfiles](https://github.com/adamgeorgeson/dotfiles)

Simple dotfiles using bash shell, vim as editor, few awesome vim plugins etc.

Currently in use on OSX 10.10.5.

Usage
========

## Clone into ~/dotfiles/

* `$ cd ~/`
* `$ git clone git@github.com:mlen108/dotfiles.git`

## Then add symlinks in your ~/ directory

* `$ cd ~/`
* `$ ln -nfs ~/dotfiles/vim/ .vim`
* `$ ln -nfs ~/dotfiles/vimrc .vimrc`
* `$ ln -nfs ~/dotfiles/bash_profile .bash_profile`
* `$ ln -nfs ~/dotfiles/bash_aliases .bash_aliases`
* `$ ln -nfs ~/dotfiles/gitconfig .gitconfig`

## Install Vim Plugins & Themes

* `$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
* `$ vim ~/dotfiles/vimrc`
* `:source %`
* `:PluginInstall`

You're also going to want [Powerline Fonts](https://github.com/powerline/fonts) for [vim-Airline](https://github.com/bling/vim-airline) to look right.

[Vundle](https://github.com/gmarik/Vundle.vim) is being used to manage plugins.

In the included vimrc:

#### Navigation

* [NerdTREE](https://github.com/scrooloose/nerdtree) - A tree explorer plugin for vim (defualt: off).
* [ctrl-p](https://github.com/kien/ctrlp.vim) - Fuzzy file, buffer, mru, tag, etc finder.

#### Git

* [vim-fugitive](https://github.com/tpope/vim-fugitive) - A Git wrapper so awesome, it should be illegal.
* [vim-merginal](https://github.com/idanarye/vim-merginal) - Fugitive extension to manage and merge Git branches.
* [vim-gitgutter](https://github.com/airblade/vim-gitgutter) - Shows git diff in the gutter and stages/reverts hunks.

#### Language Specific
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script) - CoffeeScript support for vim.
* [vim-ruby](https://github.com/vim-ruby/vim-ruby) - Vim/Ruby Configuration Files.
* [vim-rails](https://github.com/tpope/vim-rails) - Ruby on Rails power tools.
* [scss-syntax.vim](https://github.com/cakebaker/scss-syntax.vim)
* [vim-go](https://github.com/fatih/vim-go) - Go development plugin for Vim.

#### Visual

* [Badwolf](https://github.com/sjl/badwolf) - A Vim color scheme.
* [vim-Airline](https://github.com/bling/vim-airline) - lean & mean status/tabline for vim that's light as air.

#### Misc

* [Supertab](https://github.com/ervandew/supertab) - Perform all your vim insert mode completions with Tab.
* [Syntastic](https://github.com/scrooloose/syntastic) - Syntax checking hacks for vim.
* [tcomment_vim](https://github.com/tomtom/tcomment_vim) - An extensible & universal comment vim-plugin that also handles embedded filetypes.
* [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace) - Better whitespace highlighting for Vim.
* [vim-endwise](https://github.com/tpope/vim-endwise) - Wisely add "end" in ruby, endfunction/endif/more in vim script, etc.
* [vim-livedown](https://github.com/shime/vim-livedown) - Vim plugin for Livedown. Markdown Preview in browser.
* [vim-rspec](https://github.com/thoughtbot/vim-rspec) - Run Rspec specs from Vim.

