# Home Network Security Scan & Documentation Project

## Overview
This project documents a security assessment of my home network lab, performed as
part of my CompTIA Security+ (SY0-701) studies. The goal is to practice asset
discovery, vulnerability identification, and professional security reporting —
skills that map directly to real-world network/security operations work.

**Disclaimer:** All scanning was performed only against devices I own and control,
on a network I own/administer. Never scan networks or systems you don't have
explicit permission to test.

## Security+ 701 Domain Mapping
| Activity | Domain |
|---|---|
| Asset inventory & discovery | 4.0 Security Operations |
| Identifying open ports/services | 2.0 Threats, Vulnerabilities & Mitigations |
| Risk notes & recommendations | 5.0 Security Program Management & Oversight |
| Network architecture review | 3.0 Security Architecture |

## Tools Used
- [Nmap](https://nmap.org/) — network discovery and port scanning
- (Optional) Wireshark — packet-level verification
- Markdown — reporting

## Project Structure
```
network-scan-project/
├── README.md
├── scripts/
│   └── scan.sh              # Nmap scan commands used
├── docs/
│   └── methodology.md       # How the assessment was performed
└── reports/
    └── scan-report-template.md   # Findings + risk notes (fill in after scanning)
```

## How to Reproduce
1. Confirm you have permission to scan the target network (your own home network).
2. Run `scripts/scan.sh` (edit the target IP range first).
3. Record results in `reports/scan-report-template.md`.
4. Update this README with a summary of key findings once complete.

## Key Findings (fill in after you run your scan)
- Devices discovered:
- Notable open ports/services:
- Risks identified:
- Recommended mitigations:

## What I Learned
_A few sentences here once you've done the scan — this is the part that shows
employers you understand the "why," not just ran a tool._
