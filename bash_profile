# macOS - when you open up any terminal, the bash profile is accessed before the bashrc

echo "2. ENTERING BASH_PROFILE"
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
