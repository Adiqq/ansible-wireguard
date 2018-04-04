#!/usr/bin/env bash
modprobe udp_tunnel
modprobe nf_conntrack
modprobe xt_hashlimit
modprobe ip6_tables
cd /tmp
yum install -y libmnl-devel wget elfutils-libelf-devel
yum groupinstall "Development tools" -y
if [ ! -f /tmp/iproute2-4.15.0.tar.xz ]; then
wget https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.15.0.tar.xz
tar xf iproute2-4.15.0.tar.xz
cd iproute2-4.15.0
make clean
make
make install
cd ..
fi
if [ ! -f /tmp/WireGuard-0.0.20180304.tar.xz ]; then
wget https://git.zx2c4.com/WireGuard/snapshot/WireGuard-0.0.20180304.tar.xz
tar xf WireGuard-0.0.20180304.tar.xz
cd WireGuard-0.0.20180304/src
make clean
make
make install
modprobe wireguard
cd ..
fi