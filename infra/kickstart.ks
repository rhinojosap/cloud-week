#version=RHEL8
ignoredisk --only-use=vda
autopart --type=lvm
# Partition clearing information
clearpart --none --initlabel
# Use graphical install
graphical --non-interactive
# Use CDROM installation media
cdrom
# Keyboard layouts
keyboard --vckeymap=latam --xlayouts='latam'
# System language
lang es_MX.UTF-8

# Network information
network --bootproto=static --ip=10.0.0.20 --netmask=255.255.255.0 --gateway=10.0.0.1 --nameserver=10.0.0.1 --device=enp1s0 
network --hostname=master-1.kubernetes.cluster.localtest
repo --name="AppStream" --baseurl=file:///run/install/repo/AppStream
# Root password
rootpw --iscrypted $6$NqEpjydOWPpPFQvE$1TmRdeC3RRUcPFYCo3Gc3Gy57ivK0CvT2lgVtYFWP2SF/Jx2MhPiSIR8ZICC6IpJEvtH3wixR4ig3cZWOoOCZ/
#SELinux
selinux --permissive
# Run the Setup Agent on first boot
#firstboot --enable
# Do not configure the X Window System
skipx
# System services
services --enabled="chronyd"
# System timezone
timezone America/New_York --isUtc

%packages
@^minimal-environment
kexec-tools

%end
