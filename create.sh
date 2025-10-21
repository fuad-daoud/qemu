qemu-img create -f qcow2 ubuntu.qcow2 30G
qemu-system-x86_64 -enable-kvm \
   -m 4096 -smp 4 \
  -cdrom ubuntu.iso \
  -hda ubuntu.qcow2 \
  -boot d \
  -vga std

