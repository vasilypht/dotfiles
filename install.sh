#!/bin/zsh


command_exists() {
    command -v $* >/dev/null
}


install_omz_plugins() {
    # Checking if git is installed
    command_exists git || {
        echo "git is not installed!"
        echo "Install git and try again..."
        exit 1
    }

    # zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &>/dev/null && {
        echo "Plugin zsh-autosuggestions successfully installed. \n"
        echo "Add the plugin to the list of plugins (inside ~/.zshrc):"
        echo "plugins=("
        echo "    # other plugins..." 
        echo "    zsh-autosuggestions"
        echo ") \n"
    } || {
        echo "Error installing plugin zsh-autosuggestions. \n"
        exit 1
    }

    # zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &>/dev/null && {
        echo "Plugin zsh-syntax-highlighting successfully installed. \n"
        echo "Add the plugin to the list of plugins (inside ~/.zshrc):"
        echo "plugins=("
        echo "    # other plugins..." 
        echo "    zsh-syntax-highlighting"
        echo ") \n"
    } || {
        echo "Error installing plugin zsh-syntax-highlighting. \n"
        exit 1
    }

    # zsh-history-substring-search
    git clone https://github.com/zsh-users/zsh-history-substring-search \
        ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search &>/dev/null && {
        echo "Plugin zsh-history-substring-search successfully installed. \n"
        echo "Add the plugin to the list of plugins (inside ~/.zshrc):"
        echo "plugins=("
        echo "    # other plugins..." 
        echo "    zsh-history-substring-search"
        echo ") \n"
    } || {
        echo "Error installing plugin zsh-history-substring-search. \n"
        exit 1
    }
}



echo -n "Install plugins for Oh My Zsh? (y|N): "
read answer

case $answer in
    "y")
        install_omz_plugins
        ;;
esac


create_cfg_symlinks() {
    command_exists ln || {
        echo "Command aaa not found!"
        echo "Install command and try again."
        exit 1
    }

    ln -s ~/dotfiles/.config/alacritty ~/.config/alacritty
    ln -s ~/dotfiles/.config/bat ~/.config/bat
    ln -s ~/dotfiles/.config/starship.toml ~/.config/starship.toml
    ln -s ~/dotfiles/.config/tmux ~/.config/tmux

    mkdir ~/.config/nvim >/dev/null
    ln -s ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
    echo "Done!"
}


echo -n "Create symbolic links to configs? (y|N): "
read answer

case $answer in
    "y")
        create_cfg_symlinks
        ;;
esac


