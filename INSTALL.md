# Installation guide

This is a guide of how install and configure my arch linux.
**Note: the folder "configs" is the clone of this repo.**

## Before a clean install of arch (after booted with arch-chroot)

### Install a network manager and enable it

```bash
pacman -S networkmanager
systemctl enable NetworkManager
```

### Install the bootloader Grub

```bash
pacman -S grub efibootmgr os-prober
grub-install --target=x86_64-efi --efi-directory=/boot
# Enable os-prober in the grub config
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
```

For customize the grub menu, visit this [repo](https://github.com/vinceliuice/grub2-themes).

### Making your user

```bash
useradd -m <username>
passwd <username>
usermod -aG wheel,video,audio,storage username
```

### Setup sudo command

```bash
pacman -S sudo
```

Add this line in **/etc/sudoers**:

```ini
%wheel ALL=(ALL) ALL
```

### Finish the basic setup

Now you can exit and boot with the bios:

```bash
exit
umount -R /mnt/
reboot
```

## Useful tools

```bash
pacman -S unzip curl wget
```

## AUR

In my case I'm using yay, install with
the [official guide](https://github.com/Jguer/yay).

## Fonts

I use ubuntu mono nerd font in my editor and window manager,
and a collection of fonts for the system or other programs.

```bash
pacman -S ttf-dejavu ttf-liberation noto-fonts
```

And for the nerd font, download the [zip](https://github.com/ryanoasis/nerd-fonts).

```bash
# Creates the folder for the fonts of user
mkdir ~/.local/share/fonts/
# And unzip the content and install it
unzip font.zip
mv *.ttf ~/.local/share/fonts/
# Upload the font cache
fc-cache -f -v
```

## Desktop and login manager

```bash
pacman -S xorg xorg-xinit lightdm lightdm-webkit2-greeter qtile alacritty python python-psutil rofi scrot
yay -S lightdm-webkit-theme-aether
```

### Config the login manager

**/etc/lightdm/lightdm.conf**:

```ini
[Seat:*]
# Uncomment this line for modify the greeter
greeter-session = lightdm-webkit2-greeter
[greeter]
# And add this for set the theme for the login 
webkit_theme = lightdm-webkit-theme-aether
```

Then enable the service:

```bash
systemctl enable lightdm
```

Setup the user boot commands:

```bash
ln -s /home/user/configs/.xprofile /home/user/.xprofile
```

### Window manager config

```bash
ln -s /home/user/configs/.config/qtile /home/user/.config/qtile
```

For open the programs i use rofi:

```bash
ln -s /home/user/configs/.config/rofi /home/user/.config/rofi
```

And the papirus icon theme:

```bash
pacman -S papirus-icon-theme
```

## Controllers

### Audio controller

```bash
# Pavucontrol is a gui client for audio control
pacman -S pulseaudio pavucontrol
systemctl --user enable pulseaudio
```

### Brightness controller

```bash
pacman -S brightnessctl
```

### Battery controllers

```bash
pacman -S acpid tlp
systemctl enable acpid tlp
# A gui client for config tlp
yay -S tlpui
```

### Time sync

```bash
pacman -S ntp
systemctl enable ntpd
# Sync the hour with the command below
timedatectl set-ntp true
```

## Terminal and shell

I use alacritty for the terminal client:

```bash
pacman -S alacritty
```

```bash
ln -s /home/user/configs/.config/alacritty /home/user/.config/alacritty
ln -s /home/user/configs/.bashrc /home/user/.bashrc
# And create the .enviroment for env configs with a bash script
echo '#!/bin/bash' > .enviroment
```

For shell i use [nushell](http://www.nushell.sh/):

```bash
pacman -S nushell
# And copy the config
ln -s /home/user/configs/.config/nushell /home/user/.config/nushell
```

## Multimedia

```bash
pacman -S nsxiv vlc
```

## File explorer

```bash
pacman -S ranger
# Setup the config
ln -s /home/guillex/configs/.config/ranger /home/guillex/.config/ranger
```

## Development

### Code editor

I use neovim as my text editor.

Install [Packer](https://github.com/wbthomason/packer.nvim) for plugins management.

```bash
pacman -S neovim xsel fd
# Setup the config
ln -s /home/user/configs/.config/nvim /home/user/.config/nvim
nvim +PackerSync
```

### Typescript and javascript

```bash
yay -S nodejs npm
```

### Go lang

```bash
pacman -S go
```

### Python

```bash
pacman -S python python-pip
```

### C++

```bash
pacman -S clang make cmake
```

### Rust

See the install guide in his [web](https://www.rust-lang.org/tools/install).
