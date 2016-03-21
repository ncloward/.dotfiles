ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"

DISABLE_UPDATE_PROMPT=true

plugins=(gitfast brew bundle gem vagrant)
source $ZSH/oh-my-zsh.sh

# Fix for gruvbox theme
~/.vim/bundle/gruvbox/gruvbox_256palette_osx.sh

# Vim mode for zsh
bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-incremental-search-backward

# Change color based on vim mode
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1

# User configuration
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Users/ncloward/.rbenv/shims:/usr/local/heroku/bin:$PATH"
source $HOME/.zshenv

alias v="vagrant"

alias ve='source ve/bin/activate'
alias gw='gulp watch'

alias mp3="youtube-dl -x --audio-format mp3  -o \"%(title)s.%(ext)s\" --restrict-filenames"

clear_python_cache() {
  rm **/*.pyc
  rm -rf __pycache__
}

# Every once in a while I use this to record DJ sets for later listening.
rip_radio_danz() {
  cd ~/Music/streamripper
  streamripper http://server1.radiodanz.com:8020 -q -u FreeAmp/2.x
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/groovy/libexec:$PATH"
export PATH="/Applications/Authentise.app/Contents/Resources:$PATH"

# Disable globbing for pip
alias pip="noglob pip"
