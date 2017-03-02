all: vim git

vim: vim-bepo

vim-base:
	ln -s $(CURDIR)/.vim ~/.vim
	ln -s $(CURDIR)/.vimrc ~/.vimrc

vim-bepo: vim-base
	ln -s $(CURDIR)/.vimrc.bepo ~/.vimrc.bepo

git:
	ln -s $(CURDIR)/.gitconfig ~/.gitconfig
	
hammerspoon:
	ln -s $(CURDIR)/.hammerspoon ~/.hammerspoon
