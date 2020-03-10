all: introText bash git vim endText

introText:
	@echo "Let's upgrade your coding experience.\n"

endText:
	@echo "\n>^.^<\n@JohnnyPlease"

bash:
	@echo "Updating your .bashrc..."
# Native Makefile syntax
# ifeq ("$(shell test -e ${FILE_PATH} && echo ex)","ex")
# 	@echo Bashrc exists
#	mv ~/.bashrc ~/.bashrc_bak \
# else
# 	@echo Bashrc does not exists
# endif

# Shell Scripting Syntax
	@if [ -f ~/.bashrc ]; \
	then \
		echo "Making backup copy of existing bashrc"; \ #NEED TO HAVE THE ; and the
		mv ~/.bashrc ~/.bashrc_bak; \
	fi
#	@echo "Creating symtlink"
#	ln -s ${PWD}/bashrc ~/.bashrc
#	source ~/.bashrc

git:
	@echo "Upgrading your .gitconfig..."

vim:
	@echo "Updating your .vimrc..."
