#!/bin/bash

echo -e "\e[31mpls Update everything before saving configs\e[0m"

# Hyprpaper
echo "==> saving Hyprpaper configs and systemd.service"
mkdir -p config
cp -f ~/.config/hypr/scripts/hyprpaper_daycycle_changer.sh ./config/
cp -f ~/.config/systemd/user/hyprpaper_cycle.service ./config/
cp -f ~/.config/systemd/user/hyprpaper_cycle.timer ./config/
mkdir -p config/pictures/
cp -r -f ~/Pictures/Wallpapers config/pictures

echo "==> reverse copy and run The following command"
echo "systemctl --user daemon-reload"
echo "systemctl --user enable hyprpaper_cycle.service"
echo "==============================================="
echo " "

# Kitty
echo "==> saving Kitty configs"
cp -f ~/.config/kitty/kitty.conf ./config/
echo "========================"
echo " "

# zsh
echo "==> saving zsh configs"
echo -e "\e[31mInstall 'oh-my-zsh' before applying the config!! 'https://ohmyz.sh/#install'\e[0m"
cp -f ~/.zshrc ./config/
echo -e "\e[31mAnd remember to insatll the plugins from '.zshrc'\e[0m"

# Nvim with lazyvim
echo "==> saving nvim/lazyvim config"
echo -e "\e[31mLazyVim config could be out-of-date\e[0m"
cp -rf ~/.config/nvim/ ./config/
echo "========================"
echo " "
