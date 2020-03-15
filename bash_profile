# macOS - when you open up any terminal, the bash profile is accessed before the bashrc

echo "1. ENTERING BASH_PROFILE"
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi

# Git Completion in Bash
if type brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi
