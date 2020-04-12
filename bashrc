# macOS - when you open up any terminal, the bash profile is accessed before the bashrc
echo "2. ENTERING BASHRC"

set_prompt() {
## ------------- Terminal Prompt -------------
# You can have the color begin in 0; or 1; - It seems like 1 makes the text a bit bolder and hence a bit brighter
Red='\[\e[01;31m\]'
Green='\[\e[0;32m\]'
Yellow='\[\e[0;33m\]'
Blue='\[\e[0;34m\]'
Purple='\[\e[0;35m\]'
Cyan='\[\e[0;36m\]'
White='\[\e[01;37m\]'
Orange='\[\e[01;31m\]'
Reset='\[\e[00m\]'

# Git - Get the current branch
get_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Edit terminal prompt
# PS1="$Cyan\d $Green\t $Yellow\u@\h: $Purple\w"
PS1="$Cyan\t $Green\u:$Purple$(get_git_branch) "
# If outside of your home directory, print the current directory in orange, yellow otherwise.
if [[ $PWD/ != /Users/$USER/* ]]; then
PS1+="$Orange\\w "
else
PS1+="$Yellow\\w "
fi
# Reset the text color to the default.
PS1+="\\\$$Reset "
}

# You need this in order for get_git_branch to work properly
PROMPT_COMMAND='set_prompt'

## ------------- NVM -------------
## TODO - Check if nvm and node both exist
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm use default

## echo "You are using node version $( node -v )"

## ------------- Node Modules -------------
alias listAllGlobalNodeModules="npm list -g --depth=0"
alias listAllGlobalNodeModules2="ls -l $(npm root -g)"
# https://stackoverflow.com/questions/40593660/list-all-globally-installed-modules-with-one-command-in-ubuntu

## ------------- Listing With Colors -------------
# Edit colorscheme for when you list files
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
# The first ls does not work for Mac. https://www.cyberciti.biz/faq/apple-mac-osx-terminal-color-ls-output-option/
# alias lsOLD="ls --color=auto"
alias ls="ls -G"

## ------------- Moving -------------
alias mv="mv -v"

## ------------- Finding and Grepping -------------
alias findHere="find . -name"
alias grepHere="grep --color=auto --ignore-case"
alias grep="grep --color=auto"
alias helpFind="echo 'find PATH -name NAME'"
alias helpGrep="echo 'grep -ir PHASE PATH'"
# Let there be color in grep! GREP_OPTIONS is deprecated and will not work
# export GREP_OPTIONS='—-color=auto'
# https://unix.stackexchange.com/questions/69262/is-grep-options-color-always-ignored

## ------------- Bashrc-------------
alias editBash="vim ~/.bashrc"
alias updateBash="source ~/.bashrc"

## ------------- Processes and Port -------------
alias listProcesses='ps aux'
# alias whatsUsingPortOLD="findPort(){ lsof -i:'$1'; unset -f findPort; }; findPort" #DOESNT WORK - NEED TO BE DOUBLE QUOTE
alias whatsUsingPort='findPort(){ lsof -i:"$1"; unset -f findPort; }; findPort'
# https://unix.stackexchange.com/questions/3773/how-to-pass-parameters-to-an-alias
alias portsInUse='portsInUse'

portsInUse() {
    echo "Find ports that are responsible for network connections"
    lsof -i | grep -oE 'TCP \*:[0-9]{4}' | grep -oE '[0-9]+' | uniq
}

## ------------- Miscellaneous -------------
LetsCodeDir="~/Desktop"
alias createComponent="yo project"
alias letsCode="echo -e '1. Type in editBash.\n2. Update the letsCode alias so you cd into the directory of your choice.'; cd ${LetsCodeDir}"
alias makeTempFileAndFolder='makeTempFileAndFolder'

makeTempFileAndFolder() {
    folderName="deleteFolder";
    fileName="deleteFile";
    if [ $1 ]
    then
        folderName=$1;
    fi
    if [ $2 ]
    then
        fileName=$2;
    fi
    mkdir $folderName;
    touch $folderName/$fileName.docx;
    echo $folderName $fileName;
}
