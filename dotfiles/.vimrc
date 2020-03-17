execute pathogen#infect()
syntax on
filetype plugin indent on

let mapleader=","

set path+=**
set wildmenu
set wildmode=longest:full,full

" Plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/nerdtree'
Plug 'https://github.com/tpope/vim-dispatch.git'
call plug#end()

set wildignore+=*.o

"incsearch currently not working
:set incsearch
:set hlsearch 
nnoremap <C-_> :noh<CR>


"Colors
color slate
hi Search ctermbg=172 ctermfg=255
hi ErrorMsg ctermbg=White ctermfg=Red
hi Comment ctermfg=190

"Map F1 to Esc
map <F1> <Esc>
imap <F1> <Esc>

:set ignorecase

"hybrid line numbers only on the focused buffer
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost               * set norelativenumber
:augroup END

" enable NerdTree line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

"tab width and auto indentation
:set tabstop=2
:set shiftwidth=2
:set expandtab

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
" nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tw  :tabclose<CR>

" fzf mappings
nnoremap <C-p> :Files<CR> 
nnoremap <C-f> :Lines<CR> 
nnoremap <C-b> :Buffers<CR>
nnoremap <C-w> :Windows<CR>
nnoremap <C-g> :BCommits<CR>

" vim Guide navigation
noremap <leader><Tab> <Esc>/<++><Enter>ciw
inoremap <leader><Tab> <Esc>/<++><Enter>ciw
vnoremap <leader><Tab> <Esc>/<++><Enter>ciw
inoremap <leader>f <++>
nnoremap <leader>f i<++>

" filetype specific makeprg 
" filetype plugin indent on
" au filetype python setlocal mp=python3\ %
" au filetype ruby setlocal mp=rspec\ %

" rspec tests
let mapleader = ","

noremap <Leader>rs :call RunSpec('spec', '-fp')<CR>
noremap <Leader>rd :call RunSpec(expand('%:h'), '-fd')<CR>
noremap <Leader>rf :call RunSpec(expand('%'), '-fd')<CR>
noremap <Leader>rl :call RunSpec(expand('%') . ":" . line('.'), '-fd')<CR>

function! RunSpec(path, opts)
	let isspec = match(@%, '_spec.rb$') != -1
	if isspec 
"    exec '!bundle exec rspec ' . a:spec_opts . ' ' . a:spec_path
		let a = system("bundle exec rspec " . a:opts . ' ' . shellescape(expand(a:path)))
    let tmp_buffer = "tmp_" . fnamemodify(a:path, ":t")
    "let tmp_buffer = "tmp_spec"
    let b_id = bufnr(l:tmp_buffer)
    if b_id > 0
      let lines = split(a, "\n")
      let remaining_lines = len(getbufline(b_id, 1, '$')) - len(lines)
      call setbufline(b_id, 1, lines + repeat([''], remaining_lines))
    else
		  setlocal splitright | vnew | set filetype=ruby buftype=nofile bufhidden=hide noswapfile |  put=a | silent exec 'file' l:tmp_buffer | set modifiable | normal gg 
    endif
	else
    echomsg 'Not a spec-file!'
	end
endfunction
