:call pathogen#infect()
:call pathogen#runtime_append_all_bundles()
:call pathogen#helptags()
:set autoindent
:set pastetoggle=<F10>
:set showmatch
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

:set tabstop=4
:set shiftwidth=4
:set expandtab
:set backup
:set backupdir=~/.vim/backup
:set directory=~/.vim/tmp
:set smarttab
