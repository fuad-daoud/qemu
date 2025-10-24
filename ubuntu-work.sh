sudo sysctl vm.nr_hugepages=8192
sudo chmod 777 /dev/hugepages
qemu-system-x86_64 -enable-kvm \
  -cpu host,kvm=on \
  -smp 8,cores=8,threads=1 \
  -m 16G \
  -mem-path /dev/hugepages \
  -mem-prealloc \
  -object iothread,id=io1 \
  -device virtio-blk-pci,drive=disk0,iothread=io1 \
  -drive if=none,id=disk0,cache=none,format=qcow2,aio=native,file=ubuntu.qcow2 \
  -vga virtio \
  -display gtk,grab-on-hover=on \
  -device virtio-serial-pci \
  -chardev qemu-vdagent,id=ch1,name=vdagent,clipboard=on \
  -device virtserialport,chardev=ch1,id=ch1,name=com.redhat.spice.0 \
  -virtfs local,path=/home/fuad/progressoft_shared/,mount_tag=hostshare,security_model=mapped-xattr

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
