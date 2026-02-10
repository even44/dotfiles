# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

precmd () { echo -n "\x1b]1337;CurrentDir=$(pwd)\x07" }

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"


# Add Syntax higlighting
zinit light zsh-users/zsh-syntax-highlighting

# Add completions
zinit light zsh-users/zsh-completions

# Add auto suggestions
zinit light zsh-users/zsh-autosuggestions

zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit


# Keybindings
bindkey -e

HISTSIZE=500
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hisT_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

alias ls='ls --color'
alias nivm='nvim'
alias nmiv='nvim'
alias c='clear'

export PATH=$PATH:/home/even44/.local/bin

eval "$(oh-my-posh init --config /home/even44/.config/ohmyposh/zen.toml zsh)"
eval "$(fzf --zsh)"



# bun completions
[ -s "/home/even44/.bun/_bun" ] && source "/home/even44/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
