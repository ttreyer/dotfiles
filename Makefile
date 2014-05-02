all: vim awesome git

vim: vim-bepo

vim-base:
	ln -s $(CURDIR)/.vim ~/.vim
	ln -s $(CURDIR)/.vimrc ~/.vimrc

vim-bepo: vim-base
	ln -s $(CURDIR)/.vimrc.bepo ~/.vimrc.bepo

awesome:
	ln -s $(CURDIR)/.config ~/.config
	ln -s $(CURDIR)/.xinitrc ~/.xinitrc
	ln -s $(CURDIR)/.Xresources ~/.Xresources

git:
	ln -s $(CURDIR)/.gitconfig ~/.gitconfig
