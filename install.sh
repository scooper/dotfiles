#!/bin/bash

overwrite_check () {
    if [ -d "$1" ] && [ -n "$1" ]; then
        read -p " - It looks like you already have a configuration in '$1'.
 - Would you like to overwrite it? (y/n): " yn
        case ${yn:0:1} in
            y|Y )
                echo 1 # overwrite
                return
            ;;
            * )
                echo 0 # do nothing
                return
            ;;
        esac
    fi

    echo 2 # not detected
    return
}

config_path="/home/$USER/.config"


echo "Setting up nvim..."
overwrite_nvim=$(overwrite_check $config_path/nvim/)

if [ $overwrite_nvim -eq 1 ] || [ $overwrite_nvim -eq 2 ]  ; then
    if [ $overwrite_nvim -eq 1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/nvim"
    fi

    cp -r "nvim/" "$config_path/"
fi


echo "Setting up tmux..."
echo " - checking tpm"

git --version 2>&1 > /dev/null
GIT_AVAILABLE=$?
if [ ! -d "~/.tmux/plugins/tpm/" ] ; then
    echo " - installing tpm"
    if [ $GIT_AVAILABLE -eq 0 ] ; then
        git clone https://github.com/tmux-plugins/tpm "~/.tmux/plugins/tpm"
    else
        echo " - git not installed, skipping"
    fi
else
    echo " - tpm already installed"
fi

overwrite_tmux=$(overwrite_check $config_path/tmux/)

if [ $overwrite_tmux -eq 1 ] || [ $overwrite_tmux -eq 2 ]  ; then
    if [ $overwrite_tmux -eq 1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/tmux"
    fi

    cp -r "tmux/" "$config_path/"
fi


echo "Setting up alacritty..."
overwrite_alacritty=$(overwrite_check $config_path/alacritty/)

if [ $overwrite_alacritty -eq 1 ] || [ $overwrite_alacritty -eq 2 ] ; then
    if [ $overwrite_alacritty -eq 1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/alacritty"
    fi
    
    cp -r "alacritty/" "$config_path/"
fi
