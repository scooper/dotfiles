#!/bin/bash

config_path="/home/$USER/.config"
nvchad_path="external/NvChad"

if [ ! -f "$nvchad_path/init.lua" ] ; then
    echo "NvChad not found, have you updated submodules?"
    exit
fi

echo "Setting up NvChad..."


if [ -d "$config_path/nvim" ] ; then
    echo "It looks like you already have an 'nvim' configuration"
    overwrite_nvim=true
    read -p "Would you like to overwrite it? (y/n): " yn
    case ${yn:0:1} in
        y|Y )
            overwrite_nvim=true
        ;;
        * )
            overwrite_nvim=false
        ;;
    esac

    if $overwrite_nvim ; then
        rm -rf "$config_path/nvim"
    fi
fi

mkdir "$config_path/nvim"
cp "$nvchad_path"/* "$config_path/nvim/"