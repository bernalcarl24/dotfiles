export ZSH="/home/carl/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git colored-man-pages zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# aliases
source ~/.aliases

# python3 --user bin
export PATH=$HOME/.local/bin:$PATH

# personal bin
export PATH=$HOME/Bin:$PATH

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" 

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPS="--extended"
export FZF_DEFAULT_COMMAND='ag \
--ignore node_modules \
--ignore .git \
--ignore dist \
--ignore target \
--ignore __pycache__ \
--ignore build \
-g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
