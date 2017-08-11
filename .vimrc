set encoding=utf-8
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mbbill/undotree'
Plugin 'sheerun/vim-polyglot'
Plugin 'yko/mojo.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'
Plugin 'pbrisbin/vim-mkdir'
Plugin 'sickill/vim-pasta'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'w0rp/ale'
"Plugin 'Valloric/YouCompleteMe'

call vundle#end()
filetype plugin indent on

" --- Setup colorscheme ---
syntax on
set number
set guifont=Ubuntu\ Mono\ derivative\ Powerline\ 12
set guioptions-=T
set background=dark
colorscheme jellybeans

" --- Enable persistant undo ---
set undofile

" --- Setup airline ---
hi clear SignColumn
let g:airline#extensions#hunks#non_zero_only=1

set laststatus=2

let g:airline_detect_paste = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" --- Setup syntastic ---
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_c_checkers = [ 'make' ]
let g:syntastic_c_compiler = 'clang'

let g:syntastic_mode_map = {
            \ "mode": "active",
            \ "passive_filetypes": [ "perl", "scala" ] }

" --- Setup Startify ---
let g:startify_list_order = [ 'bookmarks', 'sessions', 'files', 'dir', 'commands' ]
let g:startify_bookmarks = [ '~/src/perl/artisphere' ]
let g:startify_session_persistence = 1
let g:startify_change_to_vcs_root = 1

" --- Setup CtrlP ---
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_reuse_window = 'NERD'
let g:ctrlp_extensions = [ 'autoignore' ]
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](target|build)$'
  \ }

" --- Setup Mojolicious ---
let mojo_highlight_data = 1

" --- Whitespace ---
set nowrap
set tabstop=4 shiftwidth=4 expandtab
set backspace=indent,eol,start

set autoindent
set smarttab

autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
autocmd FileType make setlocal nomodeline noexpandtab
autocmd FileType perl setlocal tabstop=2 shiftwidth=2
autocmd FileType html.ep setlocal tabstop=2 shiftwidth=2
autocmd FileType php setlocal noexpandtab
autocmd FileType tex setlocal wrap linebreak
autocmd FileType text setlocal wrap linebreak

" --- Misc ---
set mouse=a

set hlsearch incsearch
set ignorecase smartcase

set ruler
set showcmd

set wildignore+=local

" --- Load bepo remap ---
if !empty(glob('~/.vimrc.bepo'))
    source ~/.vimrc.bepo
end

nnoremap <C-Left> :bprevious<CR>
nnoremap <C-Right> :bnext<CR>
"=====[ Configure ALE for error tracking ]==================
" You also need to install the following:  https://github.com/w0rp/ale

highlight AleError    ctermfg=red     cterm=bold
highlight AleWarning  ctermfg=magenta cterm=bold

augroup ALE_Autoconfig
	au!
	autocmd User GVI_Start  silent call Stop_ALE()
	autocmd User PV_Start   silent call Stop_ALE()
	autocmd User PV_End     silent call Start_ALE()
augroup END

" let g:ale_sign_column_always   = 1
let g:ale_set_loclist          = 0
let g:ale_set_quickfix         = 1
let g:ale_linters              = { 'perl': ['perl'] }
let g:ale_perl_perl_executable = 'perl'
let g:ale_perl_perl_options    = '-cw -Ilib'

nmap <silent> ;m [Toggle automake on Perl files] :call Toggle_ALE()<CR>

function! Start_ALE ()
	ALEEnable
endfunction

function! Stop_ALE ()
	silent call s:ChangeProfile(&filetype)
	ALEDisable
	call setqflist([])
	redraw!
endfunction

function! Toggle_ALE ()
	if g:ale_enabled
		call Stop_ALE()
	else
		call Start_ALE()
	endif
	echo 'Error highlighting ' . (g:ale_enabled ? 'on' : 'off')
endfunction
