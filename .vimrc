set nocompatible

call pathogen#infect()

syntax enable
filetype plugin indent on

autocmd! BufWritePost .vimrc source %

fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun

autocmd BufWritePre *.py :call <SID>StripTrailingWhitespaces()
autocmd BufWritePre *.js :call <SID>StripTrailingWhitespaces()

set smarttab
set expandtab
set tabstop=4
set shiftwidth=4

set ruler
set colorcolumn=80
highlight ColorColumn ctermbg=green

set backspace=indent,eol,start

set incsearch ignorecase hlsearch
set smartcase

" center search results
map N Nzz
map n nzz

" tab completion
set wildmenu
set wildmode=list:longest,full

function! Mosh_Tab_Or_Complete()
    if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
        return "\<C-N>"
    else
        return "\<Tab>"
endfunction

inoremap <Tab> <C-R>=Mosh_Tab_Or_Complete()<CR>

set laststatus=2
set statusline=
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file

set noerrorbells
set visualbell
set t_vb=

set term=screen-256color
set background=dark
let g:solarized_termcolors=16
colorscheme solarized

