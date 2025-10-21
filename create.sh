qemu-img create -f qcow2 ubuntu.qcow2 20G
qemu-system-x86_64 -machine q35 \
    -enable-kvm \
    -cpu host \
    -smp 8 -m 16G \
    -drive file=ubuntu.qcow2,format=qcow2,if=virtio -drive file=ubuntu.iso,media=cdrom,readonly=on \
    -vga virtio \
    -display gtk,gl=on \
    -netdev user,id=net0 -device virtio-net,netdev=net0 \


# -spice port=5930,disable-ticketing=on \
# -device virtio-serial-pci \
# -chardev spicevmc,id=vdagent,name=vdagent \
# -device virtserialport,chardev=vdagent,name=com.redhat.spice.0
# -virtfs local,path=/home/fuad/shared,mount_tag=shared,security_model=mapped-xattr,id=shared0

