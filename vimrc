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

" ****************************************************************************
" HERE BE DRAGONS!
" ****************************************************************************
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
" Sets base tags file location.
setglobal tags-=./tags tags-=./tags; tags^=./tags;
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
set colorcolumn=80,120          " Shows wrap column at 80 and 120 characters.
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
set statusline+=%#WarningMsg#   " Sets WarningMsg highlight group.
" Adds syntastic info to status line.
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*              " Restores highlighting.
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
set complete-=i                 " Scans of includes files can be slow.
set completeopt=menuone,longest " Shows completion menu and avoid preview.
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

" Expands php fdqn class name and insert on use section on insert mode.
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

" Expands php fdqn class name on insert mode.
function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
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

    " enables omni completion on local buffers.
    augroup filetype_php " {{{
        autocmd!
        autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
        autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
        autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
    augroup END " }}}

    " auto commands for php filtype.
    augroup filetype_php " {{{
        autocmd!
        autocmd FileType php setlocal commentstring=//\ %s

        " Sets buffer mappings to insert use namespace sentence.
        autocmd FileType php inoremap <localleader>ns <esc>:call IPhpInsertUse()<cr>
        autocmd FileType php noremap <localleader>ns :call PhpInsertUse()<cr>

        " Sets buffer mappings to expand fdqn class name.

        autocmd FileType php inoremap <localleader>ec <esc>:call IPhpExpandClass()<CR>
        autocmd FileType php noremap <localleader>ec :call PhpExpandClass()<CR>
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

" Converts <c-n> and <c-p> on saner version for command line history.
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" Wrapped lines goes down/up to next row, rather than next line in file.
noremap j gj
noremap k gk

" Visual shifting without exit from visual mode.
vnoremap < <gv
vnoremap > >gv

" Indent on visual model without exit.
vnoremap <tab> >gv
vnoremap <s-tab> <gv

" Go to matching pair easily with tab
nnoremap <tab> %

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

" Open empty splits easier.
nnoremap <silent> vv <c-w>v
nnoremap <silent> ss <c-w>s

" Format selected text on visual mode.
vnoremap Q gq

" Format selected paragraph.
nnoremap Q gqap

" Select on visual mode last inserted/pasted text.
nnoremap gV `[v`]

" Easy quit.
nnoremap qq :q<cr>

" Swap markers due to spanish dead keys.
nnoremap ' `
nnoremap ` '

" Saves file using sudo.
cnoremap !!w w !sudo tee % > /dev/null
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

" Go to previous quickfix entry.
noremap <leader>qp :cprevious<cr>

" Go to next quickfix entry.
noremap <leader>qn :cnext<cr>

" Opens location list window.
noremap <leader>lo :lopen<cr>

" Closes location list window.
noremap <leader>lc :lclose<cr>

" Go to previous location list entry.
noremap <leader>lp :lprevious<cr>

" Go to next location list entry.
noremap <leader>ln :lnext<cr>

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
" ++ CtrlP mappings: {{{
" Opens CtrlP.
nnoremap <leader>pp :CtrlP<cr>

" Opens CtrlP buffer list.
nnoremap <leader>pb :CtrlPBuffer<cr>

" Opens CtrlP buffer tags list.
nnoremap <leader>pt :CtrlPBufTag<cr>

" Opens CtrlP quickfix list.
nnoremap <leader>pq :CtrlPQuickfix<cr>

" Opens CtrlP undo history list.
nnoremap <leader>pu :CtrlPUndo<cr>

" Opens CtrlP clear cache.
nnoremap <leader>pu :CtrlPClearCache<cr>
" ++ }}}
" ++ UltiSnips mappings: {{{
" Opens UltiSnipsEdit.
nnoremap <leader>us :UltiSnipsEdit<cr>
" ++ }}}
" + }}}
" }}}
" [29] colors {{{
" Sets 256 color scheme based on base16 color schemes
if &t_Co == 256 || has('gui_running')
    let base16colorspace = 256

    colorscheme base16-eighties
endif
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
" + Syntastic {{{
" Always populates location list.
let g:syntastic_always_populate_loc_list = 1

" Do not open/close location list automatically.
let g:syntastic_auto_loc_list = 0

" Triggers syntastic check on file open.
let g:syntastic_check_on_open = 1

" Triggers syntastic check on write and quit.
let g:syntastic_check_on_wq = 0

" PHPCS must use PSR2 standard.
let g:syntastic_php_phpcs_args='--standard=PSR2 --report=csv'
" + }}}
" + Emmet {{{
" Uses html5 closes and attributes.
let g:emmet_html5 = 1
" + }}}
" + Conoline {{{
" Enables auto commands to show cursor line only in active window.
let g:conoline_auto_enable = 1

" Uses default colorscheme color for cursor line in normal mode.
let g:conoline_use_colorscheme_default_normal=1

" Uses default colorscheme color for cursor line in insert mode.
let g:conoline_use_colorscheme_default_insert=1
" + }}}
" + Ack {{{
" Uses ag (siver searcher) if exists on path.
if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Uses dispatch for background search.
let g:ack_use_dispatch = 1
" + }}}
" + CtrlP {{{
" Adds tags on buffer extension.
let g:ctrlp_extensions = ['buffertag', 'quickfix']

" Uses project root as base (.git, .hg, .svn, .bzr).
let g:ctrlp_working_path_mode = 'ra'

" Changes default mapping.
let g:ctrlp_map = '<f11>'

" Uses CtrlP command as default command.
let g:ctrlp_cmd = 'CtrlP'

" Changes CtrlP cache folder.
let g:ctrlp_cache_dir = '~/.vim/cache/ctrlp'

" Uses git ls-files if git project and fallback to find.
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files --cached --exclude-standard --others']
    \ },
    \ 'fallback': 'find %s -type f'
\ }

" Adds repo folder (.git, .hg, .svn) to ignore path.
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
\ }
" + }}}
" + GitGutter {{{
" Always show sign column.
let g:gitgutter_sign_column_always = 1
" + }}}
" + UltiSnips {{{
" Shows snippet edit window on vertical split.
let g:UltiSnipsEditSplit = 'vertical'

" Sets snippet base folder.
let g:UltiSnipsSnippetsDir = '~/.vim/ultisnips'

" Sets snippet expansion key.
let g:UltiSnipsExpandTrigger = '<tab>'

" Sets key to show snippet list.
let g:UltiSnipsListSnippets = '<c-tab>'

" Sets snippet placeholder jump forward key.
let g:UltiSnipsJumpForwardTrigger = '<c-f>'

" Sets snippet placeholder jump backward key.
let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
" + }}}
" + SuperTab {{{
" Uses context to use text preceding on trigger completion menu.
let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

" Fallback if context completion fails.
let g:SuperTabContextDefaultCompletionType = '<c-n>'
" + }}}
" + Airline {{{
" Enables use of powerline fonts.
let g:airline_powerline_fonts = 1

" Short form form vim modes.
  let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ 'S'  : 'S',
    \ '' : 'S',
\ }

" Uses base16 as airline theme.
let g:airline_theme = 'base16'
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
" + Base completion mappings {{{
"   To move between options simply uniform mappings:
"     * <c-n> -> Go to next completion option.
"     * <c-p> -> Go to previous completion option.
"
"   To open each different menu (see :help ins-completion):
"     * <c-n> -> Opens complete menu (see :help complete).
"     * <c-p> -> Opens complete menu inverted (see :help complete).
"     * <c-x> s -> Spelling suggestions.
"     * <c-x><c-n> -> Opens context aware complete menu.
"     * <c-x><c-p> -> Opens context aware complete menu inverted.
"     * <c-x><c-l> -> Opens complete line menu.
"     * <c-x><c-f> -> Opens file completion menu.
"     * <c-x><c-v> -> Opens vim command line completion menu.
"     * <c-x><c-]> -> Opens tags completion menu.
"     * <c-x><c-o> -> Opens omni completion menu.
"     * <c-x><c-u> -> Opens User defined completion menu.
"     * <c-x><c-k> -> Opens dictionary completion menu.
"     * <c-x><c-t> -> Opens thesaurus completion menu.
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
