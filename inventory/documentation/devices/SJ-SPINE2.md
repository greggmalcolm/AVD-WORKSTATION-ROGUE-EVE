# SJ-SPINE2
# Table of Contents

- [Management](#management)
  - [Management Interfaces](#management-interfaces)
  - [DNS Domain](#dns-domain)
  - [Name Servers](#name-servers)
  - [Domain Lookup](#domain-lookup)
  - [NTP](#ntp)
  - [Management SSH](#management-ssh)
  - [Management API HTTP](#management-api-http)
- [Authentication](#authentication)
  - [Local Users](#local-users)
  - [TACACS Servers](#tacacs-servers)
  - [AAA Server Groups](#aaa-server-groups)
  - [AAA Authentication](#aaa-authentication)
- [Aliases](#aliases)
- [Monitoring](#monitoring)
  - [TerminAttr Daemon](#terminattr-daemon)
  - [Logging](#logging)
  - [SNMP](#snmp)
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
  - [Standard Access-lists](#standard-access-lists)
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
| Management1 | oob_management | oob | MGMT | 198.18.251.102/24 | 198.18.251.1 |

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
   ip address 198.18.251.102/24
```

## DNS Domain

### DNS domain: netdevenv.net

### DNS Domain Device Configuration

```eos
dns domain netdevenv.net
!
```

## Name Servers

### Name Servers Summary

| Name Server | Source VRF |
| ----------- | ---------- |
| 198.18.250.25 | MGMT |

### Name Servers Device Configuration

```eos
ip name-server vrf MGMT 198.18.250.25
```

## Domain Lookup

### DNS Domain Lookup Summary

| Source interface | vrf |
| ---------------- | --- |
| Management1 | MGMT |

### DNS Domain Lookup Device Configuration

```eos
ip domain lookup vrf MGMT source-interface Management1
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

#### NTP Authentication

### NTP Device Configuration

```eos
!
ntp local-interface vrf MGMT Management1
ntp server vrf MGMT 129.6.15.28 prefer
ntp server vrf MGMT 129.6.15.29
ntp server vrf MGMT 132.163.97.4
```

## Management SSH


### SSH timeout and management

| Idle Timeout | SSH Management |
| ------------ | -------------- |
| default | Enabled |

### Max number of SSH sessions limit and per-host limit

| Connection Limit | Max from a single Host |
| ---------------- | ---------------------- |
| - | - |

### Ciphers and algorithms

| Ciphers | Key-exchange methods | MAC algorithms | Hostkey server algorithms |
|---------|----------------------|----------------|---------------------------|
| default | default | default | default |

### VRFs

| VRF | Status |
| --- | ------ |
| MGMT | Enabled |

### Management SSH Configuration

```eos
!
management ssh
   !
   vrf MGMT
      no shutdown
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

## TACACS Servers

### TACACS Servers

| VRF | TACACS Servers | Single-Connection |
| --- | -------------- | ----------------- |
| MGMT | 198.18.100.150 | False |

### TACACS Servers Device Configuration

```eos
!
tacacs-server host 198.18.100.150 vrf MGMT timeout 10 key 7 Arista321!
```

## AAA Server Groups

### AAA Server Groups Summary

| Server Group Name | Type  | VRF | IP address |
| ------------------| ----- | --- | ---------- |
| TACACS_GROUP | tacacs+ | MGMT | 198.18.100.150 |

### AAA Server Groups Device Configuration

```eos
!
aaa group server tacacs+ TACACS_GROUP
   server 198.18.100.150 vrf MGMT
```

## AAA Authentication

### AAA Authentication Summary

| Type | Sub-type | User Stores |
| ---- | -------- | ---------- |
| Login | default | local |
| Login | console | local |

### AAA Authentication Device Configuration

```eos
aaa authentication login default local
aaa authentication login console local
!
```

# Aliases

```eos
alias CVP ping vrf MGMT 198.18.250.50
alias M250 ping vrf MGMT 198.18.250.1
alias M251 ping vrf MGMT 198.18.251.1
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

## Logging

### Logging Servers and Features Summary

| Type | Level |
| -----| ----- |
| Console | critical |
| Monitor | notifications |
| Buffer | debugging |

| VRF | Source Interface |
| --- | ---------------- |
| - | Management1 |
| MGMT | Management1 |

| VRF | Hosts | Ports | Protocol |
| --- | ----- | ----- | -------- |
| MGMT | 198.18.100.150 | Default | UDP |

### Logging Servers and Features Device Configuration

```eos
!
logging buffered 1000 debugging
logging console critical
logging monitor notifications
logging vrf MGMT host 198.18.100.150
logging source-interface Management1
logging vrf MGMT source-interface Management1
```

## SNMP

### SNMP Configuration Summary

| Contact | Location | SNMP Traps | State |
| ------- | -------- | ---------- | ----- |
| Al Catraz | SJ | All | Disabled |
| Al Catraz | SJ | bgp, entity arista-ent-sensor-alarm, external-alarm arista-external-alarm-deasserted-notif, snmp link-down, snmp link-up | Enabled |
| Al Catraz | SJ |  | Disabled |

### SNMP ACLs
| IP | ACL | VRF |
| -- | --- | --- |
| IPv4 | SNMP_ACL | MGMT |

### SNMP Local Interfaces

| Local Interface | VRF |
| --------------- | --- |
| Management1 | MGMT |

### SNMP VRF Status

| VRF | Status |
| --- | ------ |
| MGMT | Enabled |

### SNMP Hosts Configuration

| Host | VRF | Community | Username | Authentication level | SNMP Version |
| ---- |---- | --------- | -------- | -------------------- | ------------ |
| 198.18.100.150 | MGMT | public | - | - | 2c |

### SNMP Views Configuration

| View | MIB Family Name | Status |
| ---- | --------------- | ------ |
| VIEW_ALL | ISO | Included |

### SNMP Groups Configuration

| Group | SNMP Version | Authentication | Read | Write | Notify |
| ----- | ------------ | -------------- | ---- | ----- | ------ |
| SNMPV3_RO | v3 | priv | VIEW_ALL | - | - |

### SNMP Users Configuration

| User | Group | Version | Authentication | Privacy | Remote Address | Remote Port | Engine ID |
| ---- | ----- | ------- | -------------- | ------- | -------------- | ----------- | --------- |
| V3USER | SNMPV3_RO | v3 | MD5 | aes | - | - | - |

### SNMP Device Configuration

```eos
!
snmp-server contact Al Catraz
snmp-server location SJ
snmp-server ipv4 access-list SNMP_ACL vrf MGMT
snmp-server vrf MGMT local-interface Management1
snmp-server view VIEW_ALL ISO included
snmp-server group SNMPV3_RO v3 priv read VIEW_ALL
snmp-server user V3USER SNMPV3_RO v3 auth MD5 Arista654! priv aes Arista987!
snmp-server host 198.18.100.150 vrf MGMT version 2c public
snmp-server enable traps bgp
snmp-server enable traps entity arista-ent-sensor-alarm
snmp-server enable traps external-alarm arista-external-alarm-deasserted-notif
snmp-server enable traps snmp link-down
snmp-server enable traps snmp link-up
snmp-server vrf MGMT
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
| Ethernet1 | P2P_LINK_TO_SJ-LEAF1_Ethernet2 | routed | - | 198.18.200.10/31 | default | 1500 | false | - | - |
| Ethernet2 | P2P_LINK_TO_SJ-LEAF2_Ethernet2 | routed | - | 198.18.200.14/31 | default | 1500 | false | - | - |
| Ethernet3 | P2P_LINK_TO_SJ-LEAF3_Ethernet2 | routed | - | 198.18.200.18/31 | default | 1500 | false | - | - |
| Ethernet4 | P2P_LINK_TO_SJ-LEAF4_Ethernet2 | routed | - | 198.18.200.22/31 | default | 1500 | false | - | - |
| Ethernet5 | P2P_LINK_TO_SJ-BL1_Ethernet2 | routed | - | 198.18.200.26/31 | default | 1500 | false | - | - |
| Ethernet6 | P2P_LINK_TO_SJ-BL2_Ethernet2 | routed | - | 198.18.200.30/31 | default | 1500 | false | - | - |

### Ethernet Interfaces Device Configuration

```eos
!
interface Ethernet1
   description P2P_LINK_TO_SJ-LEAF1_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.10/31
!
interface Ethernet2
   description P2P_LINK_TO_SJ-LEAF2_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.14/31
!
interface Ethernet3
   description P2P_LINK_TO_SJ-LEAF3_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.18/31
!
interface Ethernet4
   description P2P_LINK_TO_SJ-LEAF4_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.22/31
!
interface Ethernet5
   description P2P_LINK_TO_SJ-BL1_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.26/31
!
interface Ethernet6
   description P2P_LINK_TO_SJ-BL2_Ethernet2
   no shutdown
   mtu 1500
   no switchport
   ip address 198.18.200.30/31
```

## Loopback Interfaces

### Loopback Interfaces Summary

#### IPv4

| Interface | Description | VRF | IP Address |
| --------- | ----------- | --- | ---------- |
| Loopback0 | EVPN_Overlay_Peering | default | 198.18.0.2/32 |

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
   ip address 198.18.0.2/32
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
| MGMT | 0.0.0.0/0 | 198.18.251.1 | - | 1 | - | - | - |

### Static Routes Device Configuration

```eos
!
ip route vrf MGMT 0.0.0.0/0 198.18.251.1
```

## Router BGP

### Router BGP Summary

| BGP AS | Router ID |
| ------ | --------- |
| 65000|  198.18.0.2 |

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
| 198.18.200.11 | 65001 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.15 | 65001 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.19 | 65002 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.23 | 65002 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.27 | 65003 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |
| 198.18.200.31 | 65003 | default | - | Inherited from peer group IPv4-UNDERLAY-PEERS | Inherited from peer group IPv4-UNDERLAY-PEERS | - | - | - |

### Router BGP EVPN Address Family

#### EVPN Peer Groups

| Peer Group | Activate |
| ---------- | -------- |
| EVPN-OVERLAY-PEERS | True |

### Router BGP Device Configuration

```eos
!
router bgp 65000
   router-id 198.18.0.2
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
   neighbor EVPN-OVERLAY-PEERS password 7 Arista456!
   neighbor EVPN-OVERLAY-PEERS send-community
   neighbor EVPN-OVERLAY-PEERS maximum-routes 0
   neighbor IPv4-UNDERLAY-PEERS peer group
   neighbor IPv4-UNDERLAY-PEERS password 7 Arista123!
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
   neighbor 198.18.0.7 description SJ-LEAF3
   neighbor 198.18.0.8 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.8 remote-as 65002
   neighbor 198.18.0.8 description SJ-LEAF4
   neighbor 198.18.0.9 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.9 remote-as 65003
   neighbor 198.18.0.9 description SJ-BL1
   neighbor 198.18.0.10 peer group EVPN-OVERLAY-PEERS
   neighbor 198.18.0.10 remote-as 65003
   neighbor 198.18.0.10 description SJ-BL2
   neighbor 198.18.200.11 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.11 remote-as 65001
   neighbor 198.18.200.11 description SJ-LEAF1_Ethernet2
   neighbor 198.18.200.15 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.15 remote-as 65001
   neighbor 198.18.200.15 description SJ-LEAF2_Ethernet2
   neighbor 198.18.200.19 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.19 remote-as 65002
   neighbor 198.18.200.19 description SJ-LEAF3_Ethernet2
   neighbor 198.18.200.23 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.23 remote-as 65002
   neighbor 198.18.200.23 description SJ-LEAF4_Ethernet2
   neighbor 198.18.200.27 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.27 remote-as 65003
   neighbor 198.18.200.27 description SJ-BL1_Ethernet2
   neighbor 198.18.200.31 peer group IPv4-UNDERLAY-PEERS
   neighbor 198.18.200.31 remote-as 65003
   neighbor 198.18.200.31 description SJ-BL2_Ethernet2
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

## Standard Access-lists

### Standard Access-lists Summary

#### MGMT_ACL

| Sequence | Action |
| -------- | ------ |
| 10 | permit 198.18.0.0/16 |

#### SNMP_ACL

| Sequence | Action |
| -------- | ------ |
| 10 | permit host 198.18.100.150 |

### Standard Access-lists Device Configuration

```eos
!
ip access-list standard MGMT_ACL
   10 permit 198.18.0.0/16
!
ip access-list standard SNMP_ACL
   10 permit host 198.18.100.150
```

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
