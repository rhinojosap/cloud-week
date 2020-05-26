#!/usr/bin/env bash

# Update kickstart file
echo -en "Enter Hostname: "
read HOST_NAME
echo -en "Enter IP Address: "
read IP_ADDRESS
sudo sed -i 's/SERVER_NAME/'$HOST_NAME'/g' /home/rafael/Desarrollo/cloud-week/infra/kickstart.ks
sudo sed -i 's/IP_SERVER/'$IP_ADDRESS'/g' /home/rafael/Desarrollo/cloud-week/infra/kickstart.ks
 
## Pre-defined variables
echo ""
echo -en "Memory Size: "
read MEM_SIZE
echo -en "Numero de VCPUS: "
read VCPUS
OS_VARIANT="centos8"
ISO_FILE="/home/rafael/ISOs/CentOS-8.1.1911-x86_64-dvd1.iso"

echo -en "Enter vm name: "
read VM_NAME
OS_TYPE="linux"
echo -en "Enter virtual disk size : "
read DISK_SIZE
 
sudo virt-install \
     --name ${VM_NAME} \
     --memory=${MEM_SIZE} \
     --vcpus=${VCPUS} \
     --os-type ${OS_TYPE} \
     --location ${ISO_FILE} \
     --disk size=${DISK_SIZE}  \
     --network bridge=virbr1 \
     --graphics=none \
     --os-variant=${OS_VARIANT} \
     --console pty,target_type=serial \
     --graphics spice,listen=127.0.0.1 \
     -x 'console=ttyS0,115200n8 serial' \
     -x "ks=file:/home/rafael/Desarrollo/cloud-week/infra/kickstart.ks"

sudo virsh destroy master; sudo virsh undefine master; sudo rm -fr /var/lib/libvirt/images/master.qcow2

sudo virt-install \
     --name master \
     --memory=4048 \
     --vcpus=2 \
     --os-type "linux" \
     --location "/mnt/iso" \
     --disk size=20  \
     --network bridge=virbr1 \
     --graphics=none \
     --os-variant=centos8 \
     --graphics spice,listen=127.0.0.1 \
     --extra-args "ks=ftp://10.0.0.1:21/pub/kickstart.ks console=tty0 console=ttyS0,115200n8"




mount -t iso9660 -o loop /home/rafael/ISOs/CentOS-8.1.1911-x86_64-dvd1.iso /mnt/iso