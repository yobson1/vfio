# Installing prerequisites
sudo apt-get install qemu-kvm libvirt-daemon-system libvirt-clients bridge-utils

# Installing libvirt qemu hooks
sudo mkdir -p /etc/libvirt/hooks
sudo wget 'https://raw.githubusercontent.com/PassthroughPOST/VFIO-Tools/master/libvirt_hooks/qemu' \ -O /etc/libvirt/hooks/qemu
sudo chmod +x /etc/libvirt/hooks/qemu
sudo systemctl restart libvirtd

# Setting up directories
sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10
sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10/prepare/begin
sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10/release/end

# Installing hook scripts

