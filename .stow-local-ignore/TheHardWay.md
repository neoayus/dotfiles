Install Arch in A Flash Drive. Boot Using that Drive And Follow These Commands. 

#intitialise! 

pacman -Sy 
pacman -S archlinux-keyring 

lsblk 
"let the drive i want to perform on is nvme0n1 

fdisk 
p 
g
p 

" efi disk 
n 
partition number : 1 
first sector : 
Last sector : +1G

" boot
n 
partition number : 2 
first sector :
Last sector : +1G

"swap memory 
n 
partition number : 1 
first sector : 
Last sector : +16G

"rest file system 
n 
partition number : 1 
first sector : 
Last sector : 

"format partition 
t 
parition number : 4 
partition type or alias : 44 

p 
w 

" make first partition fat32
mkfs.fat -F32 /dev/nvme0n1p1 

"make second partiion ext4 
mkfs.ext4 /dev/nvme0n1p2 

mkswap /dev/nvme0n1p3 
swapon /dev/nvme0n1p3



pvcreate /dev/nvme0n1p4 
vgcreate volgroup0 /dev/nvme0n1p4 
lvcreate -L 30G volgroup0 -n lv_root 
lvcreate -L 250G volgroup0 -n lv_home 

vgdisplay 
lvdisplay 

"insert kernel volume 
modprobe dm_mod 
vgscan 
vgchange -ay  
mkfs.ext4 /dev/volgroup0/lv_root 
mkfs.ext4 /dev/volgroup0/lv_home 

mount /dev/volgroup0/lv_root /mnt 
mkdir /mnt/boot 
mount /dev/nvme0p2  /mnt/boot 

mkdir /mnt/home 
mount /dev/volgroup0/v_home /mnt/home 

packstrap -i /mnt base 

genfstab -U -p /mnt >> /mnt/etc/fstab 
cat /mnt/etc/fstab 

arch-chroot /mnt 
"command prompt changes 

passwd 
"enter password 

useradd -m -g users -G wheel user_name 
"user_name is a variable 
passwd user_name 
"enter pass for user 

"install additional packages 
pacman -S base-devel dasfstools grub efibootmgr gnome gnome-tweaks lvm2 mtools nvim networkmanager openssh os-prober sudo 

"install iinux 
pacman -S linu linux-headers linux-lts linux-lets-headers 

pacman -S linux-firmware 

"install gpu drivers 
pci 
"for nvidia 
pacman -S nvidia nvidia-utils

"for intel 
pacman -S intel-media-driver

"for amd 
pacman -S libva-mesa-driver 

nvim /etc/mkinitcpio.conf 
"include the lvm2 between 'block' and 'filesystems' in HOOKS= line 
"also include resume after lvm2 if swap is there

"config locals/grub 
mkinitcpio -p linux 
" or linux-lts, idk if i'lm supposed to do both 

nvim /etc/locale.gen
" search for en_US and uncomment that 

locale-gen 

"setup efi parititon 
" on rot @ archiso 

mkdir /boot/efi 
mount /dev/nvme0n1p1 /boot/EFI

" install grub bootlaoder 
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --efi-directory=/boot/EFI --recheck 

cp /usr/share/locale/en\@quot/LC_MESSAGES/ grub.mo -o /boot/grub/grub.cfg 

"enable gdm 
systemctl enable gdm 
systemctl enable NetworkManager 
exit 
umount -a 
reboot 

