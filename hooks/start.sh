#!/bin/bash
# Helpful to read output when debugging
set -x

## Load the config file with our environmental variables
source "/etc/libvirt/hooks/kvm.conf"

systemctl stop nvidia-persistenced

# Unbind the GPU from display driver
virsh nodedev-detach $VIRSH_GPU_VIDEO
virsh nodedev-detach $VIRSH_GPU_AUDIO
# Unbind SSD from nvme
virsh nodedev-detach $VIRSH_NVME_SSD

# Load VFIO kernel module
modprobe vfio
modprobe vfio_iommu_type1
modprobe vfio_pci
