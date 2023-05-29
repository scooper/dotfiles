#!/bin/bash

overwrite_check () {
    if [ -d "$1" ] && [ -n "$1" ]; then
        read -p " - It looks like you already have a configuration in '$1'.
 - Would you like to overwrite it? (y/n): " yn
        case ${yn:0:1} in
            y|Y )
                return 1 # overwrite
            ;;
            * )
                return 0 # do nothing
            ;;
        esac
    fi

    return 2 # not detected
}

config_path="/home/$USER/.config"
nvchad_path="external/NvChad"

if [ ! -f "$nvchad_path/init.lua" ] ; then
    echo "NvChad not found, have you updated submodules?"
    exit
fi

echo "Setting up nvim..."

overwrite_nvim=$(overwrite_check $config_path/nvim/)

if [ $overwrite_nvim=1 ] || [ $overwrite_nvim=2 ] ; then
    if [ $overwrite_nvim=1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/nvim"
    fi

    rsync -a --exclude=".*" "$nvchad_path/" "$config_path/nvim/"
    rsync -a "nvim/" "$config_path/nvim/lua/custom/"
fi


echo "Setting up tmux..."

overwrite_tmux=$(overwrite_check $config_path/tmux/)

if [ $overwrite_tmux=1 ] || [ $overwrite_tmux=2 ]  ; then
    if [ $overwrite_tmux=1 ] ; then
        echo " - Overwriting..."
        rm -rf "$config_path/tmux"
    fi

    rsync -a "tmux/" "$config_path/tmux"
fi
