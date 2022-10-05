# AVD_FABRIC

# Table of Contents

- [Fabric Switches and Management IP](#fabric-switches-and-management-ip)
  - [Fabric Switches with inband Management IP](#fabric-switches-with-inband-management-ip)
- [Fabric Topology](#fabric-topology)
- [Fabric IP Allocation](#fabric-ip-allocation)
  - [Fabric Point-To-Point Links](#fabric-point-to-point-links)
  - [Point-To-Point Links Node Allocation](#point-to-point-links-node-allocation)
  - [Loopback Interfaces (BGP EVPN Peering)](#loopback-interfaces-bgp-evpn-peering)
  - [Loopback0 Interfaces Node Allocation](#loopback0-interfaces-node-allocation)
  - [VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)](#vtep-loopback-vxlan-tunnel-source-interfaces-vteps-only)
  - [VTEP Loopback Node allocation](#vtep-loopback-node-allocation)

# Fabric Switches and Management IP

| POD | Type | Node | Management IP | Platform | Provisioned in CloudVision |
| --- | ---- | ---- | ------------- | -------- | -------------------------- |
| AVD_FABRIC | spine | AVD-VEOS1 | 198.18.99.101/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | spine | AVD-VEOS2 | 198.18.99.102/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | l3leaf | AVD-VEOS3 | 198.18.99.103/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | l3leaf | AVD-VEOS4 | 198.18.99.104/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | l3leaf | AVD-VEOS5 | 198.18.99.105/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | l3leaf | AVD-VEOS6 | 198.18.99.106/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | l3leaf | AVD-VEOS7 | 198.18.99.107/24 | vEOS-LAB | Provisioned |
| AVD_FABRIC | l3leaf | AVD-VEOS8 | 198.18.99.108/24 | vEOS-LAB | Provisioned |

> Provision status is based on Ansible inventory declaration and do not represent real status from CloudVision.

## Fabric Switches with inband Management IP
| POD | Type | Node | Management IP | Inband Interface |
| --- | ---- | ---- | ------------- | ---------------- |

# Fabric Topology

| Type | Node | Node Interface | Peer Type | Peer Node | Peer Interface |
| ---- | ---- | -------------- | --------- | ----------| -------------- |
| spine | AVD-VEOS1 | Ethernet1 | l3leaf | AVD-VEOS3 | Ethernet1 |
| spine | AVD-VEOS1 | Ethernet2 | l3leaf | AVD-VEOS4 | Ethernet1 |
| spine | AVD-VEOS1 | Ethernet3 | l3leaf | AVD-VEOS5 | Ethernet1 |
| spine | AVD-VEOS1 | Ethernet4 | l3leaf | AVD-VEOS6 | Ethernet1 |
| spine | AVD-VEOS1 | Ethernet5 | l3leaf | AVD-VEOS7 | Ethernet1 |
| spine | AVD-VEOS1 | Ethernet6 | l3leaf | AVD-VEOS8 | Ethernet1 |
| spine | AVD-VEOS2 | Ethernet1 | l3leaf | AVD-VEOS3 | Ethernet2 |
| spine | AVD-VEOS2 | Ethernet2 | l3leaf | AVD-VEOS4 | Ethernet2 |
| spine | AVD-VEOS2 | Ethernet3 | l3leaf | AVD-VEOS5 | Ethernet2 |
| spine | AVD-VEOS2 | Ethernet4 | l3leaf | AVD-VEOS6 | Ethernet2 |
| spine | AVD-VEOS2 | Ethernet5 | l3leaf | AVD-VEOS7 | Ethernet2 |
| spine | AVD-VEOS2 | Ethernet6 | l3leaf | AVD-VEOS8 | Ethernet2 |
| l3leaf | AVD-VEOS3 | Ethernet3 | mlag_peer | AVD-VEOS4 | Ethernet3 |
| l3leaf | AVD-VEOS3 | Ethernet4 | mlag_peer | AVD-VEOS4 | Ethernet4 |
| l3leaf | AVD-VEOS5 | Ethernet3 | mlag_peer | AVD-VEOS6 | Ethernet3 |
| l3leaf | AVD-VEOS5 | Ethernet4 | mlag_peer | AVD-VEOS6 | Ethernet4 |
| l3leaf | AVD-VEOS7 | Ethernet3 | mlag_peer | AVD-VEOS8 | Ethernet3 |
| l3leaf | AVD-VEOS7 | Ethernet4 | mlag_peer | AVD-VEOS8 | Ethernet4 |

# Fabric IP Allocation

## Fabric Point-To-Point Links

| Uplink IPv4 Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ---------------- | ------------------- | ------------------ | ------------------ |
| 172.31.255.0/24 | 256 | 24 | 9.38 % |

## Point-To-Point Links Node Allocation

| Node | Node Interface | Node IP Address | Peer Node | Peer Interface | Peer IP Address |
| ---- | -------------- | --------------- | --------- | -------------- | --------------- |
| AVD-VEOS1 | Ethernet1 | 172.31.255.8/31 | AVD-VEOS3 | Ethernet1 | 172.31.255.9/31 |
| AVD-VEOS1 | Ethernet2 | 172.31.255.12/31 | AVD-VEOS4 | Ethernet1 | 172.31.255.13/31 |
| AVD-VEOS1 | Ethernet3 | 172.31.255.16/31 | AVD-VEOS5 | Ethernet1 | 172.31.255.17/31 |
| AVD-VEOS1 | Ethernet4 | 172.31.255.20/31 | AVD-VEOS6 | Ethernet1 | 172.31.255.21/31 |
| AVD-VEOS1 | Ethernet5 | 172.31.255.24/31 | AVD-VEOS7 | Ethernet1 | 172.31.255.25/31 |
| AVD-VEOS1 | Ethernet6 | 172.31.255.28/31 | AVD-VEOS8 | Ethernet1 | 172.31.255.29/31 |
| AVD-VEOS2 | Ethernet1 | 172.31.255.10/31 | AVD-VEOS3 | Ethernet2 | 172.31.255.11/31 |
| AVD-VEOS2 | Ethernet2 | 172.31.255.14/31 | AVD-VEOS4 | Ethernet2 | 172.31.255.15/31 |
| AVD-VEOS2 | Ethernet3 | 172.31.255.18/31 | AVD-VEOS5 | Ethernet2 | 172.31.255.19/31 |
| AVD-VEOS2 | Ethernet4 | 172.31.255.22/31 | AVD-VEOS6 | Ethernet2 | 172.31.255.23/31 |
| AVD-VEOS2 | Ethernet5 | 172.31.255.26/31 | AVD-VEOS7 | Ethernet2 | 172.31.255.27/31 |
| AVD-VEOS2 | Ethernet6 | 172.31.255.30/31 | AVD-VEOS8 | Ethernet2 | 172.31.255.31/31 |

## Loopback Interfaces (BGP EVPN Peering)

| Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| ------------- | ------------------- | ------------------ | ------------------ |
| 192.168.255.0/24 | 256 | 8 | 3.13 % |

## Loopback0 Interfaces Node Allocation

| POD | Node | Loopback0 |
| --- | ---- | --------- |
| AVD_FABRIC | AVD-VEOS1 | 192.168.255.1/32 |
| AVD_FABRIC | AVD-VEOS2 | 192.168.255.2/32 |
| AVD_FABRIC | AVD-VEOS3 | 192.168.255.5/32 |
| AVD_FABRIC | AVD-VEOS4 | 192.168.255.6/32 |
| AVD_FABRIC | AVD-VEOS5 | 192.168.255.7/32 |
| AVD_FABRIC | AVD-VEOS6 | 192.168.255.8/32 |
| AVD_FABRIC | AVD-VEOS7 | 192.168.255.9/32 |
| AVD_FABRIC | AVD-VEOS8 | 192.168.255.10/32 |

## VTEP Loopback VXLAN Tunnel Source Interfaces (VTEPs Only)

| VTEP Loopback Pool | Available Addresses | Assigned addresses | Assigned Address % |
| --------------------- | ------------------- | ------------------ | ------------------ |
| 192.168.254.0/24 | 256 | 6 | 2.35 % |

## VTEP Loopback Node allocation

| POD | Node | Loopback1 |
| --- | ---- | --------- |
| AVD_FABRIC | AVD-VEOS3 | 192.168.254.5/32 |
| AVD_FABRIC | AVD-VEOS4 | 192.168.254.5/32 |
| AVD_FABRIC | AVD-VEOS5 | 192.168.254.7/32 |
| AVD_FABRIC | AVD-VEOS6 | 192.168.254.7/32 |
| AVD_FABRIC | AVD-VEOS7 | 192.168.254.9/32 |
| AVD_FABRIC | AVD-VEOS8 | 192.168.254.9/32 |
