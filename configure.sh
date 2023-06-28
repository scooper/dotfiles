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
nvchad_path="external/NvChad"
alacritty_catppuccin_path="external/alacritty"

if [ ! -f "$nvchad_path/init.lua" ] ; then
    echo "NvChad not found, have you updated submodules?"
    exit
fi

if [ ! -f "$alacritty_catppuccin_path/catppuccin-mocha.yml"] ; then
    echo "Alacritty catppuccin theme not found, have you updated submodules?"
    exit
fi

echo "Setting up nvim..."

overwrite_nvim=$(overwrite_check $config_path/nvim/)

if [ $overwrite_nvim -eq 1 ] || [ $overwrite_nvim -eq 2 ]  ; then
    if [ $overwrite_nvim -eq 1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/nvim"
    fi

    rsync -a --exclude=".*" "$nvchad_path/" "$config_path/nvim/"
    rsync -a --include="*.lua" "nvim/" "$config_path/nvim/lua/"
    rsync "nvim/lazy-lock.json" "$config_path/nvim/"
fi


echo "Setting up tmux..."

overwrite_tmux=$(overwrite_check $config_path/tmux/)

if [ $overwrite_tmux -eq 1 ] || [ $overwrite_tmux -eq 2 ]  ; then
    if [ $overwrite_tmux -eq 1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/tmux"
    fi

    rsync -a "tmux/" "$config_path/tmux"
fi

echo "Setting up alacritty..."

overwrite_alacritty=$(overwrite_check $config_path/alacritty/)

if [ $overwrite_alacritty -eq 1 ] || [ $overwrite_alacritty -eq 2 ] ; then
    if [ $overwrite_alacritty -eq 1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/alacritty"
    fi
    
    mkdir "$config_path/alacritty"
    mkdir "$config_path/alacritty/catppuccin"
    rsync -a "alacritty/" "$config_path/alacritty"
    rsync -a --exclude=".*" "$alacritty_catppuccin_path/" "$config_path/alacritty/catppuccin"
fi
