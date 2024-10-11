#!/bin/bash
set -x

## Load the config file
source "/etc/libvirt/hooks/kvm.conf"

# Unload VFIO-PCI Kernel Driver
modprobe -r vfio_pci
modprobe -r vfio_iommu_type1
modprobe -r vfio

# Re-Bind GPU to host
virsh nodedev-reattach $VIRSH_GPU_VIDEO
virsh nodedev-reattach $VIRSH_GPU_AUDIO
# Re-Bind SSD to nvme
virsh nodedev-reattach $VIRSH_NVME_SSD

systemctl start nvidia-persistenced
