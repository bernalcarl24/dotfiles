export ZSH="/home/carlb/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=( \
    git \
    colored-man-pages \
    zsh-syntax-highlighting \
    zsh-autosuggestions \
    vi-mode \
)

source $ZSH/oh-my-zsh.sh

# aliases
source ~/.aliases

# python3
export PATH=$HOME/.local/bin:$PATH

# golang
export PATH=/usr/local/go/bin:$PATH
export PATH=$HOME/go/bin:$PATH

# ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# personal bin
export PATH=$HOME/bin:$PATH
export PATH=$HOME/scripts:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
