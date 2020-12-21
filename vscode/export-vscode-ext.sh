#!/bin/bash

INSTALLER_NAME="install-vscode-ext.sh"

if [[ -z "$1" ]]; then
    # default the path to my usual config location
    VSC_CONFIG_PATH="/home/carlbernal/dotfiles/vscode"
else
    VSC_CONFIG_PATH=$1
fi

echo "path is set to $VSC_CONFIG_PATH"

# create installer file if it doesn't exist
if [[ ! -f $VSC_CONFIG_PATH/$INSTALLER_NAME ]]; then
    touch $INSTALLER_NAME
    chmod +x $INSTALLER_NAME
fi

code --list-extensions | xargs -L 1 echo code --install-extension \
> $VSC_CONFIG_PATH/$INSTALLER_NAME

sed -i '1s/^/#!\/bin\/bash\n\n/' $VSC_CONFIG_PATH/$INSTALLER_NAME

echo "VSC extensions saved"
