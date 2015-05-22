# APPEARANCE

export CLICOLOR=1

autoload -U colors
colors

git_prompt_dirty() {
  dirty=$(git status --porcelain 2> /dev/null)
  if [[ -n $dirty ]]; then
    echo " ⚡︎"
  fi
}

git_prompt_info() {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " [ %F{red}$current_branch%F{reset}%F{yellow}$(git_prompt_dirty)%F{reset} ]"
  fi
}

setopt promptsubst
export PS1='%2~%{$reset_color%}$(git_prompt_info) »%b '

# BEHAVIOR

fpath=(~/.zsh/completion $fpath)

autoload -U compinit
compinit

for function in ~/.zsh/functions/*; do
  source $function
done

setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

setopt extendedglob

# BINDINGS

bindkey -v
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward

# CONFIG

for config in ~/.zsh/configs/*; do
  source $config
done

# PLUGINS

# for plugin in ~/.zsh/plugins/**/*.zsh; do
#   source $plugin
# done


# ALIASES

[[ -f ~/.aliases ]] && source ~/.aliases

# ADDITIONAL CONFIG

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
