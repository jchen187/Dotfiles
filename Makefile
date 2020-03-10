all: introText bash git vim endText sendHelp

introText:
	@echo "Let's upgrade your coding experience.\n"

endText:
	@echo "\n>^.^<\n@JohnnyPlease"

sendHelp:
	@echo "Sending in some tech support"
### TODO: Update link with own page
	@open https://www.google.com -a Google\ Chrome

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
	#TODO - check if it is a symlink
	@if [ -f ~/.bashrc ]; \
	then \
		echo "Making backup copy of existing bashrc located in ~/.bashrc_bak"; \
		mv ~/.bashrc ~/.bashrc_bak; \
	fi
	@echo "Creating symlink"
	ln -sf ${PWD}/bashrc ~/.bashrc
	ln -sf ${PWD}/bash_profile ~/.bash_profile
	source ~/.bash_profile

git:
	@echo "Upgrading your .gitconfig..." #Can you put comment here? Yes.

vim:
	@echo "Updating your .vimrc..."
