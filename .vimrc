:syntax on
:set fileformat=unix
:call pathogen#infect()
:call pathogen#runtime_append_all_bundles()
:call pathogen#helptags()
:filetype plugin indent on
:set autoindent
:set pastetoggle=<F10>
:set showmatch
:set ignorecase
:set smartcase
:set matchtime=0
:set hlsearch
:set incsearch
:nnoremap <C-j> :tabn<CR>
:nnoremap <C-k> :tabp<CR>
:inoremap <C-j> <C-o>:tabn<CR>
:inoremap <C-k> <C-o>:tabp<CR>
:nmap <C-s> :w<CR>
:inoremap <C-s> <C-o>:w<CR>
:inoremap <C-z> <C-o><C-z>
:nnoremap x "_x
:nnoremap dx "_dd

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set backup
:set backupdir=~/.vim/backup,~/vimfiles/backup
:set directory=~/.vim/tmp,~/vimfiles/tmp
:set smarttab
:set bs=2

:set nocindent
:set linebreak
:set showbreak=...

:set encoding=utf-8
:set fileencoding=utf-8
:set autochdir

if filereadable( expand( '~/.vim/buildHaml.vim' ))
    source ~/.vim/buildHaml.vim
else
    source ~/vimfiles/buildHaml.vim
endif
:redraw

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }
