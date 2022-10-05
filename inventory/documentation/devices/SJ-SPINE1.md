# SJ-SPINE1
# Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [Name Servers](#name-servers)
  - [NTP](#ntp)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
- [Aliases](#aliases)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
- [Spanning Tree](#spanning-tree)
  - [Spanning Tree Summary](#spanning-tree-summary)
  - [Spanning Tree Device Configuration](#spanning-tree-device-configuration)
- [Internal VLAN Allocation Policy](#internal-vlan-allocation-policy)
  - [Internal VLAN Allocation Policy Summary](#internal-vlan-allocation-policy-summary)
  - [Internal VLAN Allocation Policy Configuration](#internal-vlan-allocation-policy-configuration)
- [Interfaces](#interfaces)
  - [Ethernet Interfaces](#ethernet-interfaces)
  - [Loopback Interfaces](#loopback-interfaces)
- [Routing](#routing)
  - [Service Routing Protocols Model](#service-routing-protocols-model)
  - [IP Routing](#ip-routing)
  - [IPv6 Routing](#ipv6-routing)
  - [Static Routes](#static-routes)
  - [Router BGP](#router-bgp)
- [BFD](#bfd)
  - [Router BFD](#router-bfd)
- [Multicast](#multicast)
- [Filters](#filters)
  - [Prefix-lists](#prefix-lists)
  - [Route-maps](#route-maps)
- [ACL](#acl)
- [VRF Instances](#vrf-instances)
  - [VRF Instances Summary](#vrf-instances-summary)
  - [VRF Instances Device Configuration](#vrf-instances-device-configuration)
- [Quality Of Service](#quality-of-service)

# Management

## Management Interfaces

### Management Interfaces Summary

#### IPv4

| Management Interface | description | Type | VRF | IP Address | Gateway |
| -------------------- | ----------- | ---- | --- | ---------- | ------- |
| Management1 | oob_management | oob | MGMT | 198.18.99.101/24 | 198.18.99.1 |

#### IPv6

| Management Interface | description | Type | VRF | IPv6 Address | IPv6 Gateway |
| -------------------- | ----------- | ---- | --- | ------------ | ------------ |
| Management1 | oob_management | oob | MGMT | -  | - |

### Management Interfaces Device Configuration

```eos
!
interface Management1
   description oob_management
   no shutdown
   vrf MGMT
   ip address 198.18.99.101/24
```

## Name Servers

### Name Servers Summary

| Name Server | Source VRF |
| ----------- | ---------- |
| 198.18.100.160 | MGMT |

### Name Servers Device Configuration

```eos
ip name-server vrf MGMT 198.18.100.160
```

## NTP

### NTP Summary

#### NTP Local Interface

| Interface | VRF |
| --------- | --- |
| Management1 | MGMT |

#### NTP Servers

| Server | VRF | Preferred | Burst | iBurst | Version | Min Poll | Max Poll | Local-interface | Key |
| ------ | --- | --------- | ----- | ------ | ------- | -------- | -------- | --------------- | --- |
| 129.6.15.28 | MGMT | True | - | - | - | - | - | - | - |
| 129.6.15.29 | MGMT | - | - | - | - | - | - | - | - |
| 132.163.97.4 | MGMT | - | - | - | - | - | - | - | - |

### NTP Device Configuration

```eos
!
ntp local-interface vrf MGMT Management1
ntp server vrf MGMT 129.6.15.28 prefer
ntp server vrf MGMT 129.6.15.29
ntp server vrf MGMT 132.163.97.4
```

## Management API HTTP

### Management API HTTP Summary

| HTTP | HTTPS | Default Services |
| ---- | ----- | ---------------- |
| False | True | - |

### Management API VRF Access

| VRF Name | IPv4 ACL | IPv6 ACL |
| -------- | -------- | -------- |
| MGMT | - | - |

### Management API HTTP Configuration

```eos
!
management api http-commands
   protocol https
   no shutdown
   !
   vrf MGMT
      no shutdown
```

# Authentication

## Local Users

### Local Users Summary

| User | Privilege | Role |
| ---- | --------- | ---- |
| admin | 15 | network-admin |
| ansible | 15 | network-admin |
| cvpadmin | 15 | network-admin |

### Local Users Device Configuration

```eos
!
username admin privilege 15 role network-admin secret sha512 $6$pwmzPZqxql2yZ.ge$Cx7b5gTa9C7go/skTK0W88zdkBxFBuAmsol.TkWcnGlpRQohUMxzzHQmIzyZ/5M8T33.qSZMFPsgMgmTzM6r01
username ansible privilege 15 role network-admin secret sha512 $6$K0SFGHUNW.al69Yo$///VGqkYDYDpUjXKFkSWa5.WVnANiBPD8d/An/HP2I/IOd6AYSXJ9VL6FrjYrwp/SLsqwZLB7KV4hB9HGAyKv.
username cvpadmin privilege 15 role network-admin secret sha512 $6$lhcX5i6a7cVCvwux$n4KM19WOV6cFG0QumteDf9A3SA.GmBJidlSuHfWd/x9KB2yEVjynw8Kr10KJFQ0eeBgBGONpdT1HzP1uGjg3C.
```

# Aliases

```eos
alias CVP ping vrf MGMT 198.18.99.90
alias M99 ping vrf MGMT 198.18.99.1
alias M98 ping vrf MGMT 198.18.98.1
alias MAC sh bgp evpn route-type mac-ip
alias PRE sh bgp evpn route-type ip-prefix ipv4

!
```

# Monitoring

## TerminAttr Daemon

### TerminAttr Daemon Summary

| CV Compression | CloudVision Servers | VRF | Authentication | Smash Excludes | Ingest Exclude | Bypass AAA |
| -------------- | ------------------- | --- | -------------- | -------------- | -------------- | ---------- |
| gzip | 198.18.99.90:9910 | MGMT | key, | ale,flexCounter,hardware,kni,pulse,strata | /Sysdb/cell/1/agent,/Sysdb/cell/2/agent | False |

### TerminAttr Daemon Device Configuration

```eos
!
daemon TerminAttr
   exec /usr/bin/TerminAttr -cvaddr=198.18.99.90:9910 -cvauth=key, -cvvrf=MGMT -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -taillogs
   no shutdown
```

# Spanning Tree

## Spanning Tree Summary

STP mode: **none**

## Spanning Tree Device Configuration

```eos
!
spanning-tree mode none
```

# Internal VLAN Allocation Policy

## Internal VLAN Allocation Policy Summary

| Policy Allocation | Range Beginning | Range Ending |
| ------------------| --------------- | ------------ |
| ascending | 1006 | 1199 |

## Internal VLAN Allocation Policy Configuration

```eos
!
vlan internal order ascending range 1006 1199
```

# Interfaces

## Ethernet Interfaces

### Ethernet Interfaces Summary

#### L2

| Interface | Description | Mode | VLANs | Native VLAN | Trunk Group | Channel-Group |
| --------- | ----------- | ---- | ----- | ----------- | ----------- | ------------- |

*Inherited from Port-Channel Interface

#### IPv4

| Interface | Description | Type | Channel Group | IP Address | VRF |  MTU | Shutdown | ACL In | ACL Out |
| --------- | ----------- | -----| ------------- | ---------- | ----| ---- | -------- | ------ | ------- |
| Ethernet1 | P2P_LINK_TO_SJ-LEAF1_Ethernet1 | routed | - | 198.18.200.8/31 | default | 1500 | false | - | - |
| Ethernet2 | P2P_LINK_TO_SJ-LEAF2_Ethernet1 | routed | - | 198.18.200.12/31 | default | 1500 | false | - | - |
| Ethernet3 | P2P_LINK_TO_SJ-DCI1_Ethernet1 | routed | - | 198.18.200.16/31 | default | 1500 | false | - | - |
| Ethernet4 | P2P_LINK_TO_SJ-DCI2_Ethernet1 | routed | - | 198.18.200.20/31 | default | 1500 | false | - | - |
| Ethernet5 | P2P_LINK_TO_SJ-LEAF3_Ethernet1 | routed | - | 198.18.200.24/31 | default | 1500 | false | - | - |
| Ethernet6 | P2P_LINK_TO_SJ-LEAF4_Ethernet1 | routed | - | 198.18.200.28/31 | default | 1500 | false | - | - |

### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description P2P_LINK_TO_SJ-LEAF1_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.8/31
!
interface Ethernet2
   description P2P_LINK_TO_SJ-LEAF2_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.12/31
!
interface Ethernet3
   description P2P_LINK_TO_SJ-DCI1_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.16/31
!
interface Ethernet4
   description P2P_LINK_TO_SJ-DCI2_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.20/31
!
interface Ethernet5
   description P2P_LINK_TO_SJ-LEAF3_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.24/31
!
interface Ethernet6
   description P2P_LINK_TO_SJ-LEAF4_Ethernet1
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.28/31
```

## Loopback Interfaces

### Loopback Interfaces Summary

#### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 198.18.0.1/32 |

#### IPv6

| Interface | Description | VRF | IPv6 Address |
| --------- | ----------- | --- | ------------ |
| Loopback0 | EVPN_Overlay_Peering | default | - |


### Loopback Interfaces Device Configuration

```eos
!
interface Loopback0
   description EVPN_Overlay_Peering
   no shutdown
   ip address 198.18.0.1/32
```

# Routing
## Service Routing Protocols Model

Multi agent routing protocol model enabled

```eos
!
service routing protocols model multi-agent
```

## IP Routing

### IP Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | true |
| MGMT | false |

### IP Routing Device Configuration

```eos
!
ip routing
no ip routing vrf MGMT
```
## IPv6 Routing

### IPv6 Routing Summary

| VRF | Routing Enabled |
| --- | --------------- |
| default | false |
| MGMT | false |

## Static Routes

### Static Routes Summary

| VRF | Destination Prefix | Next Hop IP             | Exit interface      | Administrative Distance       | Tag               | Route Name                    | Metric         |
| --- | ------------------ | ----------------------- | ------------------- | ----------------------------- | ----------------- | ----------------------------- | -------------- |
| MGMT | 0.0.0.0/0 | 198.18.99.1 | - | 1 | - | - | - |

### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 198.18.99.1
```

## Router BGP

### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65000|  198.18.0.1 |

| BGP Tuning |
| ---------- |
| no bgp default ipv4-unicast |
| distance bgp 20 200 200 |
| graceful-restart restart-time 300 |
| graceful-restart |
| maximum-paths 4 ecmp 4 |

### Router BGP Peer Groups

#### EVPN-OVERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | evpn |
| Next-hop unchanged | True |
| Source | Loopback0 |
| BFD | True |
| Ebgp multihop | 3 |
| Send community | all |
| Maximum routes | 0 (no limit) |

#### IPv4-UNDERLAY-PEERS

| Settings | Value |
| -------- | ----- |
| Address Family | ipv4 |
| Send community | all |
| Maximum routes | 12000 |

### BGP Neighbors

| Neighbor | Remote AS | VRF | Shutdown | Send-community | Maximum-routes | Allowas-in | BFD | RIB Pre-Policy Retain |
| -------- | --------- | --- | -------- | -------------- | -------------- | ---------- | --- | --------------------- |
| 198.18.0.5 | 65001 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - |
| 198.18.0.6 | 65001 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - |
| 198.18.0.7 | 65002 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - |
| 198.18.0.8 | 65002 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - |
| 198.18.0.9 | 65003 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - |
| 198.18.0.10 | 65003 | default | - | Inherited from peer group EVPN-OVERLAY-PEERS | Inherited from peer group EVPN-OVERLAY-PEERS | - | Inherited from peer group EVPN-OVERLAY-PEERS | - |
| 198.18.200.9 | 65001 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.13 | 65001 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.17 | 65002 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.21 | 65002 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.25 | 65003 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.29 | 65003 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |

### Router BGP EVPN Address Family

#### EVPN Peer Groups

| Peer Group | Activate |
| ---------- | -------- |
| EVPN-OVERLAY-PEERS | True |

### Router BGP Device Configuration

```eos
!
router bgp 65000
   router-id 198.18.0.1
   no bgp default ipv4-unicast
   distance bgp 20 200 200
   graceful-restart restart-time 300
   graceful-restart
   maximum-paths 4 ecmp 4
   neighbor EVPN-OVERLAY-PEERS peer group
   neighbor EVPN-OVERLAY-PEERS next-hop-unchanged
   neighbor EVPN-OVERLAY-PEERS update-source Loopback0
   neighbor EVPN-OVERLAY-PEERS bfd
   neighbor EVPN-OVERLAY-PEERS ebgp-multihop 3
   neighbor EVPN-OVERLAY-PEERS password 7 q+VNViP5i4rVjW1cxFv2wA==
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS password 7 AQQvKeimxJu+uGQ/yYvv9w==
   neighbor IPv4-UNDERLAY-PEERS send-community
   neighbor IPv4-UNDERLAY-PEERS maximum-routes 12000
   neighbor 198.18.0.5 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.5 remote-as 65001
   neighbor 198.18.0.5 description SJ-LEAF1
   neighbor 198.18.0.6 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.6 remote-as 65001
   neighbor 198.18.0.6 description SJ-LEAF2
   neighbor 198.18.0.7 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.7 remote-as 65002
   neighbor 198.18.0.7 description SJ-DCI1
   neighbor 198.18.0.8 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.8 remote-as 65002
   neighbor 198.18.0.8 description SJ-DCI2
   neighbor 198.18.0.9 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.9 remote-as 65003
   neighbor 198.18.0.9 description SJ-LEAF3
   neighbor 198.18.0.10 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.10 remote-as 65003
   neighbor 198.18.0.10 description SJ-LEAF4
   neighbor 198.18.200.9 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.9 remote-as 65001
   neighbor 198.18.200.9 description SJ-LEAF1_Ethernet1
   neighbor 198.18.200.13 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.13 remote-as 65001
   neighbor 198.18.200.13 description SJ-LEAF2_Ethernet1
   neighbor 198.18.200.17 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.17 remote-as 65002
   neighbor 198.18.200.17 description SJ-DCI1_Ethernet1
   neighbor 198.18.200.21 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.21 remote-as 65002
   neighbor 198.18.200.21 description SJ-DCI2_Ethernet1
   neighbor 198.18.200.25 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.25 remote-as 65003
   neighbor 198.18.200.25 description SJ-LEAF3_Ethernet1
   neighbor 198.18.200.29 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.29 remote-as 65003
   neighbor 198.18.200.29 description SJ-LEAF4_Ethernet1
   redistribute connected route-map RM-CONN-2-BGP
   !
   address-family evpn
      neighbor EVPN-OVERLAY-PEERS activate
   !
   address-family ipv4
      no neighbor EVPN-OVERLAY-PEERS activate
      neighbor IPv4-UNDERLAY-PEERS activate
```

# BFD

## Router BFD

### Router BFD Multihop Summary

| Interval | Minimum RX | Multiplier |
| -------- | ---------- | ---------- |
| 3600 | 3600 | 5 |

### Router BFD Device Configuration

```eos
!
router bfd
   multihop interval 3600 min-rx 3600 multiplier 5
```

# Multicast

# Filters

## Prefix-lists

### Prefix-lists Summary

#### PL-LOOPBACKS-EVPN-OVERLAY

| Sequence | Action |
| -------- | ------ |
| 10 | permit 198.18.0.0/24 eq 32 |

### Prefix-lists Device Configuration

```eos
!
ip prefix-list PL-LOOPBACKS-EVPN-OVERLAY
   seq 10 permit 198.18.0.0/24 eq 32
```

## Route-maps

### Route-maps Summary

#### RM-CONN-2-BGP

| Sequence | Type | Match and/or Set |
| -------- | ---- | ---------------- |
| 10 | permit | match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY |

### Route-maps Device Configuration

```eos
!
route-map RM-CONN-2-BGP permit 10
   match ip address prefix-list PL-LOOPBACKS-EVPN-OVERLAY
```

# ACL

# VRF Instances

## VRF Instances Summary

| VRF Name | IP Routing |
| -------- | ---------- |
| MGMT | disabled |

## VRF Instances Device Configuration

```eos
!
vrf instance MGMT
```

# Quality Of Service