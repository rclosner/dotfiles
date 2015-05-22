# VARIABLES

export ZSH=$HOME/.zsh
export VISUAL=vim
export EDITOR="$VISUAL"
export PATH="./bin:$HOME/.bin:/usr/local/sbin:/usr/local/bin:$PATH"

# ADDITIONAL CONFIG

[[ -f ~/.zshenv.local ]] && source ~/.zshenv.local
