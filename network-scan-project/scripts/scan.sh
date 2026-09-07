#!/bin/bash
# scan.sh
# Basic network discovery and port scan for home lab documentation project.
#
# IMPORTANT: Only run against networks/devices you own or have explicit
# permission to test.

# ---- CONFIG ----
# Replace with your actual home network range, e.g. 192.168.1.0/24
TARGET_RANGE="192.168.1.0/24"

# ---- 1. Host discovery: find live devices on the network ----
echo "[*] Discovering live hosts on $TARGET_RANGE ..."
nmap -sn "$TARGET_RANGE" -oN ../reports/raw-host-discovery.txt

# ---- 2. Port scan on discovered hosts (edit target IP after step 1) ----
# TARGET_HOST="192.168.1.10"
# echo "[*] Scanning ports on $TARGET_HOST ..."
# nmap -sV -O "$TARGET_HOST" -oN ../reports/raw-portscan-$TARGET_HOST.txt

# ---- 3. (Optional) Basic vulnerability script scan ----
# nmap --script vuln "$TARGET_HOST" -oN ../reports/raw-vuln-$TARGET_HOST.txt

echo "[*] Done. Review raw output files in reports/, then summarize in"
echo "    reports/scan-report-template.md"
