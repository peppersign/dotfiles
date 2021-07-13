# My basic Arch guide
***

My personal Arch linux installation guide
since I'm trying to learn OS-Ricing and more Unix.

This installation only applies on BIOS Legacy since
EFI requires extra-steps on partition formatting and
grub-mkconfig.


## Arch installation

```bash
#Set-up keymap if needed, (default is EN)
loadkeys es

#Install reflector for fastest mirrors
# -Syy => S: Sync package, yy: force database refresh
sudo pacman -Syy reflector

#Sync network time protocol
timedatectl set-ntp true

#Set-up fastests mirrors for myself
# args: sort by speed, 6hours server age, save into mirrorlist conf and reload pacman with new confs
reflector -c Chile -a 6 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy

#Disk partition (For LEGACY)
cfdisk /dev/sda

# Interactive shell section
#
# 1. Label type (my case): dos
# 2. Create partition with 256M (/dev/sda1)
# 3. Selecting /dev/sda1, press 'B' to make it bootable (boot partition)
# 4. Create root partiton with rest of the memory (/dev/sda2)
# 5. Write and quit


#Format partitions
mkfs.ext4 /dev/sda1
mkfs.ext4 /dev/sda2

#Mount partitons
mount /dev/sda2 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot

#Install Arch
pacstrap /mnt base base-devel linux linux-firmware vim

#Filesystem table generation based on UUID (-U)
genfstab -U /mnt >> /mnt/etc/fstab

# Second part, installation in changeroot
arch-chroot /mnt

# Timezone config: 
#1. create symbolic link with my localtime zone
#   in localtime (FLAGS => s: softlink, f: rewrite if already exist one link)
ln -sf /usr/share/zoneinfo/Region/(City /etc/localtime #Replace region and city
hwclock --systohc


#2. Edit locale.gen (can use nano if required)
vim /etc/locale.gen
# //Here, uncommment the line with your localzone in UTF-8
# //My case: es_CL.UTF-8
# //Save and quit

#3. Load
locale-gen

echo 'LANG=es_CL.UTF-8' >> /etc/locale.conf
echo 'KEYMAP=es' >> /etc/vconsole.conf #JUST IF YOU loadkeys'd

#Hostname config
echo archbox > /etc/hostname #replace archbox with whatever you want
vim /etc/hosts

# //Here, copypaste this at the end:
127.0.0.1	localhost
::1			localhost
127.0.1.1	archbox.localdomain		archbox
# //Save and quit

#Set password for root user
passwd

#Bootloader instalation and others (optional => others)
pacman -S grub networkmanager base-devel linux-headers reflector git #If you're in a VM, install virtualbox-guest-utils

#Boot configuration (IN GLOBAL DRIVE, NOT PARTITION-ONLY)
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

#Internet access after booting as startup service (network daemon)
systemctl enable NetworkManager

#Create personal user with name senkoloaf
useradd -mG wheel senkoloaf
passwd senkoloaf

#Give senkoloaf sudo privileges
EDITOR=vim visudo

# //Here, uncomment
# %wheel ALL=(ALL) ALL
# //Save and quit

#Fundamental steps done, unmount everything
exit #exit root return to instalation
umount -R /mnt

#reboot and install neofetch very important
reboot
```

***

## Graphical Enviroment

In my case I'll be using dwm as a WM and st as the terminal emulator.

```bash
#Install packages to compile succesfully dwm, and to setup graphic server.
sudo pacman -Sy xorg-server xorg-init xorg-xrandr xorg-xsetroot libx11 libxinerama libxft webkit2gtk
#Note to self: If X fails, try installing xf86-video-intel

#Clone dwm and st
git clone https://git.suckless.org/dwm
git clone https://git.suckless.org/st

#Go into dwm, and compile it, the same in st, execute this command in both folders (dwm, st)
sudo make clean install
#Note: If you will to install some patches, do it now.

#Create an init file for X (.xinitrc)
touch .xinitrc

#Edit it according your wm, in my case I'll setup dwm
#Note: you can setup other utilies in xinit, like your status bar, wallpaper, etc.
#At the end, xinit executes when you start X (startx)
vim .xinitrc
# exec dwm
# //Save and quit

#Setup st in dwm
vim st/config.h
#Replace the shell config line with '/usr/local/bin/st'
# //Save and quit

#Setup startx in bash_profile, vim into .bash_profile
vim .bash_profile
# //Append 'startx'
# //Save and quit


```

***

## Notes to self

+ `xrdb` is what you're looking for if you want to setup a color scheme.
Important: Set it up in xinit with `xrdb`

+ Whatever are you trying to run on xinit, do it BEFORE `exec dwm`,
because everything after it, will be ignored because of a proccess thing (Have to read the bash manual).

+ For dual-monitor setup, I'll use xrandr

+ May you will get this sometimes `ping: temporary name resolution error`, fix it with `dhcpcd`

+ If `loadkeys` does not work due to wm overwriting it, setup keylayout with `setxkbmap`

+ To install fontawesome, you can do it via pacman `pacman -S ttf-font-awesome`

###Help

[Xrandr official guide](https://wiki.archlinux.org/index.php/xrandr)

[Xrandr setup tutorial](https://www.youtube.com/watch?v=1Vno9kwvlj8)

[dhcpcd official guide](https://wiki.archlinux.org/index.php/dhcpcd)

```
My steps:

- Install Arch
- Automatic keylayout setup in .bashrc
- Setup wifi connection
- Setup volume keys in dwm
- Setup X and install dwm with st
	- In xinit setup dwm
	- dual monitor
	- wallpaper
	- status bar (with xsetroot)

- Install firefox 
- Additional:
	- dwm patchs (gaps)
	- dmenu
	- install fontawesome
	- scripts to write
		- usb stick mounter
		- dunst notifier
		- rice shell :p
```
