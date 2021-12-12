# Installing prerequisites
sudo pacman -Syu wget qemu-headless libvirt virt-manager bridge-utils iptables-nft dnsmasq ovmf

# Installing libvirt qemu hooks
sudo mkdir -p /etc/libvirt/hooks
sudo wget 'https://raw.githubusercontent.com/PassthroughPOST/VFIO-Tools/master/libvirt_hooks/qemu' -O /etc/libvirt/hooks/qemu
sudo chmod +x /etc/libvirt/hooks/qemu
sudo systemctl restart libvirtd

# Setting up directories
sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10
sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10/prepare/begin
sudo mkdir -p /etc/libvirt/hooks/qemu.d/win10/release/end

# Installing hook scripts
sudo wget 'https://raw.githubusercontent.com/yobson1/vfio/main/hooks/start_arch.sh' -O /etc/libvirt/hooks/qemu.d/win10/prepare/begin/start.sh
sudo wget 'https://raw.githubusercontent.com/yobson1/vfio/main/hooks/revert_arch.sh' -O /etc/libvirt/hooks/qemu.d/win10/release/end/revert.sh
sudo wget 'https://raw.githubusercontent.com/yobson1/vfio/main/hooks/cpu_mode_performance.sh' -O /etc/libvirt/hooks/qemu.d/win10/prepare/begin/cpu_mode_performance.sh
sudo wget 'https://raw.githubusercontent.com/yobson1/vfio/main/hooks/cpu_mode_ondemand.sh' -O /etc/libvirt/hooks/qemu.d/win10/release/end/cpu_mode_ondemand.sh

# Editing grub
# Ryzen settings: iommu=1 amd_iommu=on rd.driver.pre=vfio-pc
# Intel settings: intel_iommu=on
echo 'You are going to edit the GRUB_CMDLINE_LINUX_DEFAULT value. If you are on Ryzen add "iommu=1 amd_iommu=on rd.driver.pre=vfio-pc" if you are on Intel add intel_iommu=on'
read -n 1 -s -r -p 'Press any key to continue'
sudo nano /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
