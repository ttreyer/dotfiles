all: vim git

vim: vim-bepo

vim-base:
	ln -s $(CURDIR)/.vim ~/.vim
	ln -s $(CURDIR)/.vimrc ~/.vimrc

vim-bepo: vim-base
	ln -s $(CURDIR)/.vimrc.bepo ~/.vimrc.bepo

git:
	ln -s $(CURDIR)/.gitignore ~/.gitignore
	ln -s $(CURDIR)/.gitconfig ~/.gitconfig

zsh:
	# Install Oh-My-Zsh and its Powerlevel10k theme
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $${ZSH_CUSTOM:-$$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	ln -s $(CURDIR)/.zshrc ~/.zshrc
	ln -s $(CURDIR)/.p10k.zsh ~/.p10k.zsh

tmux:
	ln -s $(CURDIR)/.tmux.conf ~/.tmux.conf

