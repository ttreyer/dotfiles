set nocompatible	" Utilise les paramètres de Vim au lieu de ceux de Vi
set encoding=utf-8	" Définit l'encodage
 
" Whitespace
set nowrap			" Ne pas couper les lignes trop longues
set tabstop=4 shiftwidth=4	" Une tabulation correspond à 4 espaces
set backspace=indent,eol,start	" En mode insertion, on peut tout effacer
 
" Searching
set hlsearch		" Mettre en surbrillance les résultat
set incsearch		" Débute la recherche au moment même où l'on tape la première lettre
set ignorecase		" Ignorer la casse
set smartcase		" Sauf si il y a une lettre en majuscule

set ruler			" Affiche la position du curseur en bas à droite
set showcmd			" Affiche les commandes incomplètes (ex.: Affiche où l'on se trouve lors d'une sécance d'intsruction -ci'-)

set history=50		" Définit la taille de l'historique

if $TERM =~ '256color'
	set t_Co=256
elseif $TERM =~ '^xterm$'
	set t_Co=256
endif

set background=dark	" Définit la couleur de fond du terminal comme sombre

if has("gui_running")
	set background=light	" En cas de GUI, l'arrière plan est claire
endif

syntax on			" Active la coloration syntaxique
set number			" Affiche le N° de la ligne
if !empty(glob("~/.vim/colors/Tomorrow-Night.vim"))	" On contrôle si le thème existe
	colorscheme Tomorrow-Night
endif

set autoindent		" Permet de garder l'indentation d'une ligne à l'autre
set smarttab

if has("autocmd")
	filetype plugin indent on	" Charge les plugins et l'indentation selon le type de fichier

	" Règles particulières à certain fichier
	autocmd FileType ruby setlocal tabstop=2 shiftwidth=2
	autocmd FileType javascript setlocal tabstop=2 shiftwidth=2
	autocmd FileType python setlocal expandtab
endif

if has("mouse")
	set mouse=a		" Si le terminal support la souris, on l'active dans Vim
endif

if !empty(glob("~/.vimrc.bepo"))	" On contrôle si le fichier existe
	source ~/.vimrc.bepo
endif

set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%c,%l/%L\ %P

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
