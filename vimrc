" vim configuration - Héctor Sanjuán <hsanjuan@gmail.com>
" [ 0] modeline and notes {{{
" vim: set shiftwidth=4 tabstop=4 softtabstop=4 expandtab textwidth=78:
" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker:
"
" Personal preferences for vim editor.
"
" While much of it is beneficial for general use, I would
" recommend picking out the parts you want and understand.
"
" This file consist of "sections":
"   * The name of sections come from ":options" command.
"   * Last sections are "misc", "experimental" and "tips and tricks".
"   * Plugin specific sections come just before "misc" section.
"   * Section "misc" is for options that is not clear what their group.
"   * Section "experimental" is for testing options, plugins and mappings.
"   * Section "tips and trick" is to save useful commands, mappings, etc.
"
" To start vim without using this .vimrc file, use:
"   vim -u NORC
"
" To start vim without loading any .vimrc or plugins, use:
"   vim -u NONE
" }}}
" [ 1] important {{{
set nocompatible                " The vi is dead, long live the vim!
set pastetoggle=<f12>           " Toggle paste mode to avoid destruction!

" Add pathogen to runtime path and all plugins on bundle directory.
runtime! bundle/vim-pathogen/autoload/pathogen.vim
silent! execute pathogen#infect("bundle/{}")
" }}}
" [ 2] moving around, searching and patterns {{{
set incsearch                   " Enables incremental search.
set ignorecase                  " Ignores case on search pattern.
set smartcase                   " Overrides ignore case if term has upcase.
" }}}
" [ 3] tags {{{
setglobal tags=./tags;          " Sets base tags file.
" }}}
" [ 4] displaying text {{{
set scrolloff=1                 " Shows 1 screen lines around cursor.
set wrap                        " Wraps long lines.
set linebreak                   " Wraps without split words.
set breakindent                 " When wrap lines preserv indentation.
set sidescrolloff=5             " Shows 5 screen columns around cursor.
set display+=lastline           " Shows last line even if does not fit.
set lazyredraw                  " No redraw while executing macros.
set list                        " Shows inserted tabs as visible character.
set number                      " Shows the line number for each line.

" Sets invisible chars
if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
    let &listchars="tab:\u2023\u0020,trail:\u00b7,extends:\u00bb,precedes:\u00ab,nbsp:\u00b7,eol:\u00ac"
    let &fillchars="vert:\u0020,fold:\u00b7"
    let &showbreak="\u00a6\u0020"
else
    set listchars=tab:>.,trail:.,extends:>,precedes:<,eol:$,nbsp:+
endif
" }}}
" [ 5] syntax, highlighting and spelling {{{
set background=dark             " Sets background to dark color.
set hlsearch                    " Highlights all matches for last search.
set cursorline                  " Highlights current cursor line.
set spelllang=en_us,es_es       " Sets spell languages.

" Adds custom dictionary to add words.
set spellfile=~/.vim/spell/dict.utf-8.add
" }}}
" [ 6] multiple windows {{{
set laststatus=2                " Always show status line.
set winheight=5                 " At least show 5 lines on current window.
set winminheight=5              " At least show 5 lines on any window.
set hidden                      " Keep buffers in memory even if not shown.
set splitbelow                  " New horizontal window below the current one.
set splitright                  " New vertical window right of the current one.

" Configures status line.
set statusline=
set statusline=[%n]             " Shows current buffer number.
set statusline+=\ %<%.99f       " Shows buffer file path.
set statusline+=\ %h%w%m%r      " Shows buffer flags.
" Adds fugitive info to status line if is loaded.
set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}
set statusline+=%=              " Separation point between left and right.
set statusline+=%*              " Restore normal hightlight.
set statusline+=[%{&fenc}]      " Shows buffer file encoding.
set statusline+=[%{&ff}]        " Shows buffer file format.
set statusline+=%y              " Shows buffer file type.
set statusline+=[%l,%c%V]       " Shows buffer cursor position.
set statusline+=[%P]            " Shows buffer cursor position relative.
" Adds syntastic info to status line.
if exists("SyntasticStatuslineFlag")
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
endif
" }}}
" [ 7] multiple tab pages {{{
set showtabline=0               " Never shows tab line.
set tabpagemax=50               " Sets to 50 the maximum number of tab pages.
" }}}
" [ 8] terminal {{{
set ttyfast                     " Sets tty connection to fast.
set title                       " Shows info in the window title.
" }}}
" [ 9] using the mouse {{{
set mouse=a                     " Enables mouse in all modes.
set mousemodel=popup            " Right mouse button pop up a menu.
" }}}
" [10] printing {{{
set printoptions=paper:A4       " Sets default print paper size.
" }}}
" [11] messages and info {{{
set shortmess+=I                " Adds intro message (avoid 'hit enter').
set showcmd                     " Show partial command keys on status line.
set showmode                    " Display current mode in the status line.
set ruler                       " Show cursor position in the status line.
set noerrorbells                " Disables ring bell on errors.
set novisualbell                " Disables visual bell on errors.
set t_vb=                       " Disables the DAMN BELL !!!!!
" }}}
" [12] selecting text {{{
" Enables normal OS clipboard interaction
if has("clipboard")
    if has("unnamedplus")
        " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else
        " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif
" }}}
" [13] editing text {{{
set undolevels=1000             " Sets maximum number of changes to undone.
set backspace=indent,eol,start  " Sets backspace for normal people.
set formatoptions+=j            " Removes comment chars where joining lines.
set complete-=i                 " Scan of includes files can be slow.
set showmatch                   " Shows matched bracket pairs.
set nrformats-=octal            " Removes octal on increments/decrements.
" }}}
" [14] tabs and indenting {{{
set tabstop=4                   " Sets spaces to represent for each tab.
set shiftwidth=4                " Sets spaces to insert for each indent.
set smarttab                    " Uses shiftwidth in front of new lines.
set softtabstop=4               " Sets spaces to insert for each tab.
set shiftround                  " Round indent to multiple of shiftwidth.
set expandtab                   " Expands tabs to spaces in insert mode.
set autoindent                  " Automatically set new line indentation.
set smartindent                 " Do clever autoindent based on syntax.
" }}}
" [15] folding {{{
set foldenable                  " Enables code folding.
set foldlevel=99                " Starts with all unfolded.
set foldopen+=jump              " Opens fold with far jumps.
set foldmethod=syntax           " Folds creation based on syntax.
" }}}
" [16] diff mode {{{
set diffopt=filler              " Sets filler opt to diff for buffer binding.
" }}}
" [17] mapping {{{
set timeout                     " Sets time out for mappings.
set ttimeout                    " Sets time out for key codes.
set timeoutlen=1000             " Sets long time out for mappings.
set ttimeoutlen=50              " Sets short time out for key codes.
" }}}
" [18] reading and writing files {{{
set modeline                    " Enables the use of modelines on files.
set modelines=5                 " Sets to 5 lines to check for modelines.
set fileformats=unix,dos,mac    " Sets file formats to look for.
set backup                      " Enables backup.
set backupdir=~/.vim/backup     " Sets common backup storage folder.
set autoread                    " Reloads file if has been changed outside.
" }}}
" [19] the swap file {{{
set directory=~/.vim/swap       " Sets common swap storage folder.
set swapfile                    " Enables swap files.
" }}}
" [20] command line editing {{{
set history=1000                " Enables long command line history.
set wildmode=list:longest       " List all matches and complete longest.
set wildmenu                    " Enables command line menu completion.
set undofile                    " Enables undo file.
set undodir=~/.vim/undo         " Sets common undo storage folder.

" List of file patterns to ignore when expanding wildcars.
set wildignore+=.git,.hg,.svn
set wildignore+=tags
set wildignore+=*.pyc,*.bak,*.class,*.sw[a-z],*.o,*~,*.out,._*
set wildignore+=*.log,*.aux,*.dvi,*.aut,*.aux,*.bbl,*.blg,*.fff,*.toc
set wildignore+=*.zip,*.rar,*.tar,*.tar.gz,*tar.bz2,*.tar.xz,*.tgz
set wildignore+=*/tmp/*,*/log/*,*/cache/*,*/vendor/*
" }}}
" [21] executing external commands {{{
set shell=zsh                   " Sets zsh as shell for ! and :! commands.
" }}}
" [22] running make and jumping to errors {{{
" Configures grep usage on :grep commands.
set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude=tags
" }}}
" [23] language specific {{{
" }}}
" [24] multi-byte characters {{{
set encoding=utf-8              " Sets utf-8 default vim encoding.
set fileencoding=utf-8          " Sets utf-8 for current file.
set termencoding=utf-8          " Sets utf-8 used by the terminal.
" }}}
" [25] various {{{
set sessionoptions-=options     " No save 'options' when create sessions.
set viminfo=!,'20,<50,s10,h     " Sets viminfo options.
set viminfo+=n~/.vim/viminfo    " Sets viminfo path.
" }}}
" [26] functions {{{
" Creates file parent folders if they do not exists.
function! s:createParentFolders(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir = fnamemodify(a:file, ':h')

        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
" }}}
" [27] auto commands {{{
if has("syntax")
    syntax enable
endif

if has("autocmd")
    filetype plugin indent on   " File type detection, plugins and indent.

    " editor configuration group commands to reload on save.
    augroup editor " {{{
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
    augroup END " }}}

    " change number options between normal and insert modes.
    augroup numbering " {{{
        autocmd InsertEnter * silent! :set norelativenumber
        autocmd InsertLeave,BufNewFile,VimEnter * silent! :set relativenumber
    augroup END " }}}

    " remove trailing spaces and empty lines at the end of the file.
    augroup line_cleaning " {{{
        autocmd BufWritePre * :%s/\s\+$//e
        autocmd BufWritePre * :%s/\($\n\s*\)\+\%$//e
    augroup END " }}}

    " create file folders before write if they do no exists.
    augroup path_creating " {{{
        autocmd!
        autocmd BufWritePre * :call s:createParentFolders(expand('<afile>'), +expand('<abuf>'))
    augroup END " }}}

    " auto commands for php filtype.
    augroup filetype_php " {{{
        autocmd!
        autocmd FileType php setlocal commentstring=//\ %s
    augroup END " }}}
endif
" }}}
" [28] key mappings {{{
" + basic mappings {{{
" Maps space to leader for flex leader key and showcmd!
map <space> <leader>

" Converts <cr> to go to last line.
nnoremap <cr> G

" Converts <bs> to go to first line.
nnoremap <bs> gg

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting without exit from visual mode.
vnoremap < <gv
vnoremap > >gv

" Indent on visual model without exit.
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Normalizes forward search regex (uses very magic).
nnoremap / /\v
vnoremap / /\v

" Normalizes backward search regex (uses very magic).
nnoremap ? ?\v
vnoremap ? ?\v

" Normalizes <c-u> to save each delete as undo step.
inoremap <c-u> <c-g>u<c-u>

" Quick exit from insert mode.
inoremap jk <esc>
inoremap kj <esc>

" Mimic movement between split windows.
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l

" Format selected text on visual mode.
vnoremap Q gq

" Format selected paragraph.
nnoremap Q gqap

" Select on visual mode last inserted/pasted text.
nnoremap gV `[v`]
" + }}}
" + leader key mappings {{{
" Saves current file.
nnoremap <leader>w :w<cr>

" Clears the highlighting of :set hlsearch.
nnoremap <silent> <leader><space> :nohlsearch<c-r>=has('diff')?'<bar>diffupdate':''<cr><cr>:redraw<cr>

" Search all diff markers.
nnoremap <silent> <leader>fc <esc>/\v^[<=>]{7}( .*\|$)<cr>

" Quickly sets fold level.
nnoremap <leader>f0 :set foldlevel=0<cr>
nnoremap <leader>f1 :set foldlevel=1<cr>
nnoremap <leader>f2 :set foldlevel=2<cr>
nnoremap <leader>f3 :set foldlevel=3<cr>
nnoremap <leader>f4 :set foldlevel=4<cr>
nnoremap <leader>f5 :set foldlevel=5<cr>
nnoremap <leader>f6 :set foldlevel=6<cr>
nnoremap <leader>f7 :set foldlevel=7<cr>
nnoremap <leader>f8 :set foldlevel=8<cr>
nnoremap <leader>f9 :set foldlevel=9<cr>

" Converts current word to upper case.
nnoremap <leader>u mQviwU`Q

" Converts current word to lower case.
nnoremap <leader>l mQviwu`Q

" Convert first letter of current word to upper case.
nnoremap <leader>U mQgewvU`Q

" Convert first letter of current word to lower case.
nnoremap <leader>L mQgewvu`Q

" Shows current buffer list.
nnoremap <leader>bl :ls<cr>

" Go to next buffer.
nnoremap <leader>bn :bnext<cr>

" Go to previous buffer.
nnoremap <leader>bp :bprevious<cr>

" Go to last used buffer.
nnoremap <leader>bb :b#<cr>

" Go to new empty buffer.
nnoremap <leader>bc :enew<cr>

" Removes current buffer.
nnoremap <leader>bd :bdelete<cr>

" Removes current buffer and go to last buffer.
nnoremap <leader>bq :b# <bar> bdelete #<cr>

" Opens quickfix window.
noremap <leader>qo :copen<cr>

" Closes quickfix window.
noremap <leader>qc :cclose<cr>

" Go to previous quickfix file listings.
noremap <leader>qp :cprevious<cr>

" Go to next quickfix file listings.
noremap <leader>qn :cnext<cr>

" Toggles spell checking.
noremap <leader>ss :setlocal spell!<cr>

" Go to next spell error.
noremap <leader>sn ]s

" Go to previous spell error.
noremap <leader>sp [s

" Adds word under cursor to spell dict.
noremap <leader>sa zg

" Shows spell suggestions.
noremap <leader>s? z=

" Edit zsh config on vertical split.
nnoremap <leader>ez :vsp ~/.zshrc<cr>

" Edit vim config on vertical split.
nnoremap <leader>ev :vsp $MYVIMRC<cr>

" Source of vim vim config.
nnoremap <leader>sv :source $MYVIMRC<cr>
" + }}}
" + plugin mappings {{{
" ++ Fugitive mappings: {{{
" Shows git status.
nnoremap <leader>gs :Gstatus<cr>

" Shows git blame.
nnoremap <leader>gb :Gblame<cr>

" Shows git diff.
nnoremap <leader>gd :Gdiff<cr>

" Reloads buffer file content.
nnoremap <leader>gr :Gread<cr>

" Saves buffer file and add to git index.
nnoremap <leader>gw :Gwrite<cr>

" Executes git commit.
nnoremap <leader>gc :Gcommit -v<cr>

" Executes git move on current file.
nnoremap <leader>gm :Gmove<space>

" Executes git grep.
nnoremap <leader>gg :Ggrep<space>

" Saves to stash and reload current file.
nnoremap <leader>g- :silent Git stash<cr>:redraw!<cr>:e<cr>

" Restores from stash and reload current file.
nnoremap <leader>g+ :silent Git stash pop<cr>:redraw!<cr>:e<cr>

" Calculates git previous revision of current file and loads into quickfix.
nnoremap <leader>gl :silent Glog<cr>:redraw!<cr>:botright copen<cr>

" Go to master branch.
nnoremap <leader>gcm :Git checkout master<cr>

" Go to new branch.
nnoremap <leader>gcb :Git checkout -b<space>

" Executes git checkout.
nnoremap <leader>gco :Git checkout<space>

" Executes git push.
nnoremap <space>gps :Dispatch! git push<cr>
"
" Executes git pull.
nnoremap <space>gpl :Dispatch! git pull<cr>
" ++ }}}
" + }}}
" }}}
" [29] colors {{{
" }}}
" [30] plugins {{{
" + MatchIt {{{
" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif
" + }}}
" + EditorConfig {{{
" Excludes from editorconfig vim-fugitive and remote files.
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" + }}}
" }}}
" [31] misc {{{
if has("gui_running")
    set guioptions-=m           " Removes menubar.
    set guioptions-=T           " Removes toolbar.
    set guioptions-=l           " Removes left scrollbar.
    set guioptions-=L           " Removes left scrollbar on vertical split.
    set guioptions-=r           " Removes right scrollbar.
    set guioptions-=R           " Removes right scrollbal on vertical split.
endif
" }}}
" [99] experimental {{{
" }}}
" [XX] tips and tricks {{{
" + Folding common mappings {{{
"     * zR -> open all folds recursively
"     * zM -> close all folds recursively
"     * zO -> open all folds under cursor line
"     * zC -> close all folds under cursor line
"     * zA -> toggle all folds under cursor line
"     * zj -> go to next fold
"     * zk -> go to previous fold
"   }}}
"
" + Insert special data on insert mode with registers {{{
"   Enable insertion with <c-r> then use one of this registers:
"     * '"' -> the last deleted of yanked text.
"     * '%' -> the current file name.
"     * '#' -> the alternate file name.
"     * '*' -> the clipboard contents.
"     * '+' -> the clipboard contents.
"     * '/' -> the last search pattern.
"     * ':' -> the last command-line.
"     * '.' -> the last inserted text.
"     * '-' -> the last small delete (less than a line).
"     * '=' -> the result of expression.
"
"   Some examples of expression register (:help expression):
"     * Insert number of seconds in one day: =24*60*60
"     * Insert current date time formated: =strftime("%c")
"     * Insert the number of lines on current file: =line("$")
"   }}}
"
" + Sets viminfo options {{{
"     * !   -> Saves and restores global uppercase vars.
"     * '20 -> Saves upto 20 previous files with marks.
"     * <50 -> Saves upto 50 lines for each register.
"     * s10 -> Max sizes for registers in KB.
"     * h   -> Disables hlsearch when loading viminfo.
"   }}}
" }}}
