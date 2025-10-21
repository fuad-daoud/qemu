qemu-system-x86_64 -enable-kvm \
  -m 16384 -smp 4 \
  -hda ubuntu.qcow2 \
  -vga qxl \
  -device virtio-serial-pci \
  -spice port=5930,disable-ticketing=on \
  -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
  -chardev spicevmc,id=spicechannel0,name=vdagent \
  -virtfs local,path=/home/fuad/progressoft_shared,mount_tag=hostshare,security_model=mapped-xattr


# commands to enable sharing on the guest
# sudo mkdir /mnt/shared
# sudo mount -t 9p -o trans=virtio hostshare /mnt/shared -oversion=9p2000.L
# ```
#
# Make it permanent by adding to `/etc/fstab`:
# ```
# hostshare /mnt/shared 9p trans=virtio,version=9p2000.L,rw 0 0
#
#
#
# open UI from host using 
# remote-viewer spice://localhost:5930
