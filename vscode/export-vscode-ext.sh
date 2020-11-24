#!/bin/bash

code --list-extensions | xargs -L 1 echo code --install-extension \
> ~/Dotfiles/scripts/install-vscode-ext.sh

sed -i '1s/^/#!\/bin\/bash\n\n/' ~/Dotfiles/scripts/install-vscode-ext.sh
