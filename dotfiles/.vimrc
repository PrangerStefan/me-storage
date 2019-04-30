execute pathogen#infect()
syntax on
filetype plugin indent on

"incsearch currently not working
:set incsearch
:set hlsearch 

"hybrid line numbers only on the focused buffer
:set number relativenumber

"tab width and auto indentation
:set tabstop=2
:set shiftwidth=2
:set expandtab

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost               * set norelativenumber
:augroup END

if executable('ag')
  let g:ackprg = 'ag -Q --vimgrep'
endif

nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-Up> :bprev<CR>                                                                            
nnoremap <C-Down> :bnext<CR>

highlight StatusLineNC cterm=bold ctermfg=white ctermbg=darkgray
:set foldmethod=manual 

"airline themes
let g:airline_theme='luna'
"let g:airline_solarized_bg='dark'

let g:airline#extensions#tabline#enabled = 0

set noshowmode
set t_Co=256
set encoding=utf-8

" air-line
let g:airline_powerline_fonts = 1


if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif



" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'



" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
set runtimepath^=~/.vim/bundle/ctrlp.vim


let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" optional reset cursor on start:
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" tabs control
nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>
