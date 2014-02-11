" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Jul 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start


" make pasting work magically right
set paste

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"
"mine
"

"indent and 4-space tabs
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

"normal tab for editing Makefile
autocmd FileType make setlocal noexpandtab

"numbered lines
"set number

"horizontal line on cursor
set cursorline

set ignorecase
set smartcase

set t_Co=256

colorscheme jellybeans
syntax on
filetype indent on


map <C-n> :tabn<cr>
map <C-p> :tabp<cr>

imap jk <Esc>

"extra filename extensions
filetype on
au BufNewFile,BufRead *.gc set filetype=c
au BufNewFile,BufRead *.cunroll set filetype=c

"C++11 syntax highlighting
au BufNewFile,BufRead *.cpp set syntax=cpp11
au BufNewFile,BufRead *.hpp syntax=cpp11

"cmake syntax
au BufNewFile,BufRead CMakeLists.txt set syntax=cmake-syntax

autocmd FileType c setlocal tabstop=2
autocmd FileType cpp setlocal tabstop=2
autocmd FileType c setlocal shiftwidth=2
autocmd FileType cpp setlocal shiftwidth=2
autocmd FileType h setlocal tabstop=2
autocmd FileType hpp setlocal tabstop=2
autocmd FileType h setlocal shiftwidth=2
autocmd FileType hpp setlocal shiftwidth=2

autocmd Filetype cmake setlocal tabstop=2
autocmd Filetype cmake setlocal shiftwidth=2


autocmd FileType rb setlocal tabstop=2
autocmd FileType rb setlocal shiftwidth=2

"turn cursorline off for latex, because it is slow
autocmd FileType tex setlocal nocursorline
"hard wrap to width 70 in latex (easier sharing and diffs)
autocmd FileType tex setlocal textwidth=70

"on buffer load update ctags
"au BufWinEnter . :UpdateTags

"macros
"todo, use one command and use file extension
"comment


""Make""
" Automatically open, but do not go to (if there are errors) the quickfix /
" location list window, or close it when is has become empty.
"
" Note: Must allow nesting of autocmds to enable any customizations for
"quickfix
" buffers.
" Note: Normally, :cwindow jumps to the quickfix window if the command opens
"it
" (but not if it's already open). However, as part of the autocmd, this
"doesn't
" seem to happen.
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow


"enable NeoComplCache, which caches auto completions
let g:neocomplcache_enable_at_startup = 1


" Pathogen source
call pathogen#infect()


"syntastic
let g:syntastic_cpp_compiler_options = ' -std=c++11'
"try to get the damn c++11 syntax to work
let c_no_curly_error=1

