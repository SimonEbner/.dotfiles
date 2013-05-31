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

:set modeline
:set statusline+=%F
:set laststatus=2
:set ls=2
if exists('+colorcolumn')
    set colorcolumn=80
else
    highlight OverLength ctermbg=red ctermfg=white guibg=#592929
    match OverLength /\%81v.\+/
endif


au BufNewFile,BufReadPost *.coffee setl sw=2 sts=2 et
au BufNewFile,BufReadPost *.eco setl sw=2 sts=2 et

"
" Camel Case Movment
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<c-t>'],
    \ 'AcceptSelection("t")': ['<cr>', '<2-LeftMouse>'],
    \ }

" powerline
set nocompatible
set t_Co=256
"set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

hi User1 guifg=#eea040 guibg=#222222
hi User2 guifg=#dd3333 guibg=#222222
hi User3 guifg=#ff66ff guibg=#222222
hi User4 guifg=#a0ee40 guibg=#222222
hi User5 guifg=#eeee40 guibg=#222222

set statusline=
set statusline +=%1*\ %n\ %*            "buffer number
set statusline +=%1*\ %P\ %*                        " percentage of file
set statusline +=%1*%l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%4*\ %<%F%*            "full path
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%*             "current line
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%1*\[%{strlen(&ft)?&ft:'none'},  " filetype
set statusline +=%{strlen(&fenc)?&fenc:&enc}, " encoding
set statusline +=%{&fileformat}]              " file format
set statusline+=%=                           " right align

if has( 'win32' )
    colorscheme default
else
    colorscheme wombat256mod
endif
