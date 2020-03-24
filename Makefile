all: introText bash git vim endText sendHelp

introText:
	@echo "Let's upgrade your coding experience.\n"

endText:
	@echo "\n>^.^<\n@JohnnyPlease"
	@echo "YOU MIGHT HAVE TO RUN `source ~/.bash_profile` or `source ~/.bashrc`"

sendHelp:
	@echo "Sending in some tech support"
### TODO: Update link with own page
	@open https://www.google.com -a Google\ Chrome

cleanUp:
	@echo "Cleaning up..."
	@echo "1. Removing the symlinks"
	rm -f ~/.bashrc
	rm -f ~/.gitconfig
	rm -f ~/.vimrc
	@echo "2. Restoring the backup files"
	mv ~/.bashrc_bak ~/.bashrc
	mv ~/.gitconfig_bak ~/.gitconfig
	mv ~/.vimrc_bak ~/.vimrc
	@echo "3. Removing the contents in this folder."
	CURRENT_DIRECTORY=${PWD}
	cd ..
	rm -rf ${CURRENT_DIRECTORY}
	@echo "4. Removing brew, ack and brew git?"
# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/uninstall)"

## setup ack and git completion
brew:
	@echo "Checking if you already has brew or ack"
### TODO: Do we have brew or ack? You should be able to check with "which"
	@echo "Installing brew..."
#	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
	@echo "Installing ack..."
#	brew install ack
	@echo "Installing git..."
## TODO - install git through brew to make sure we can do git completion
#	brew install git
# 	source ~/.bash_profile
	@echo "Installing tmux"
# brew install tmux"

bash:
	@echo "Updating your .bashrc..."
# Native Makefile syntax
# ifeq ("$(shell test -e ${FILE_PATH} && echo ex)","ex")
#	@echo Bashrc exists
#	mv ~/.bashrc ~/.bashrc_bak \
# else
# 	@echo Bashrc does not exists
# endif

# NOTICE YOU NEED TO HAVE THE ; and the \.
# We force symlink with the -f option, so we dont have to remove the files
# We dont need to `source ~/.bashrc` because we do so in the bash_profile
# Shell Scripting Syntax
	@if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; \
	then \
		echo "1. Making backup copy of existing bashrc located in ~/.bashrc_bak"; \
		mv ~/.bashrc ~/.bashrc_bak; \
	fi
	@echo "2. Creating symlink"
	ln -sf ${PWD}/bashrc ~/.bashrc
	ln -sf ${PWD}/bash_profile ~/.bash_profile
	source ~/.bash_profile

git:
	@echo "Upgrading your .gitconfig..." #Can you put comment here? Yes.
## TODO - ask for name and email to populate the config file
## the name can be the $user by default
	@if [ -f ~/.gitconfig ] && [ ! -L ~/.gitconfig ]; \
	then \
		echo "1. Making backup copy of existing gitconfig located in ~/.gitconfig_bak"; \
		mv ~/.gitconfig ~/.gitconfig_bak; \
	fi
	@echo "2. Creating symlink"
	ln -sf ${PWD}/gitconfig ~/.gitconfig

vim:
	@echo "Updating your .vimrc..."
	@if [ -f ~/.vimrc ] && [ ! -L ~/.vimrc ]; \
	then \
		echo "1. Making backup copy of existing vimrc located in ~/.vimrc_bak"; \
		mv ~/.vimrc ~/.vimrc_bak; \
	fi
	@echo "2. Creating symlink"
	ln -sf ${PWD}/vimrc ~/.vimrc

vundle:
	@echo "Setting up Vim plugins"
## TODO - check if we already have something here - ~/.vim/bundle/Vundle.vim
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +PluginInstall +qall

tmux:
	@echo "Updating your tmuxconfig"

raspberrypi:
	@echo "Updating your .bashrc..."
# NOTICE YOU NEED TO HAVE THE ; and the \.
# We force symlink with the -f option, so we dont have to remove the files
# We dont need to `source ~/.bashrc` because we do so in the bash_profile
# Shell Scripting Syntax
	@if [ -f ~/.bashrc ] && [ ! -L ~/.bashrc ]; \
	then \
		echo "1. Making backup copy of existing bashrc located in ~/.bashrc_bak"; \
		mv ~/.bashrc ~/.bashrc_bak; \
	fi
	@echo "2. Creating symlink"
	ln -sf ${PWD}/bashrc_raspberrypi ~/.bashrc
	. ~/.bashrc
