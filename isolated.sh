# https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/6/html/virtualization_host_configuration_and_guest_installation_guide/app_macvtap
sudo wget 'https://raw.githubusercontent.com/yobson1/vfio/main/config/isolated.xml' -O /tmp/isolated.xml
virsh net-define /tmp/isolated.xml
virsh net-autostart isolated
virsh net-start isolated
sudo rm /tmp/isolated.xml
