# Methodology

## Scope
- Target: my home network only (specify range, e.g. 192.168.1.0/24)
- Authorization: I own/administer this network
- Tools: Nmap

## Steps

### 1. Host Discovery
Used a ping sweep (`nmap -sn`) to identify all live devices currently connected
to the network. This simulates the "asset inventory" step of a real security
assessment — you can't protect what you don't know exists.

### 2. Port & Service Scanning
For each discovered host, ran a service/version detection scan (`nmap -sV`) to
identify what's running on open ports (e.g. web servers, SSH, printers, IoT
device management interfaces).

### 3. Risk Review
For each open port/service found, noted:
- Is this service necessary?
- Is it up to date?
- Is it exposed beyond what's needed (e.g. accessible from the whole LAN vs.
  just one device)?
- Any default credentials or known CVEs for that service/version?

### 4. Recommendations
Documented mitigations for anything flagged as unnecessary or risky — e.g.
disabling unused services, changing default credentials, segmenting IoT
devices onto a guest VLAN.

## Limitations
This is a home-lab educational exercise, not a full penetration test. No
exploitation was attempted — only discovery and service enumeration.
