# Scan Report — 09-07-2026

## Scope
- Network range scanned:192.168.1.124
- Authorization: Home network, owned/administered by me

## 1. Host Discovery Results
| IP Address | Device (best guess) | Notes |
|---|---|---|
| 192.168.1.124 | SCO7-WX_4C5DO6.LAN |SCAN FOR OPEN PORTS |
| | | |

## 2. Port/Service Scan Results
|192.168.1.124|N/A | N/A |N/A | All 1000 scanned ports filitered - host firewall blocking probes|
|---|---|---|---|---|
| | | | | |

## 3. Risk Findings
| Host firewall blocks Nmap probing(no open ports detected) | Low |3.0 Security Architecture | No Action Needed- indicates firewall is properly confirgued. Note: OS detection was unreliable as a result |
|---|---|---|---|
| | | | |

## 4. Summary
The scanned host(192.168.1.124) responsed to ping but returned no open ports--all 1000 scanned ports were filteres, indicating an active firewall. This is a positive security finding.
Host discovery on the 192.168.1..0/24 network confirmed at least one active device(the router at 162.168.1.1).

## 5. Lessons Learned
I learned that a properly configured firewall can block port scanning to the point where even basic tools like Nmap can't reliably fingerprint the OS or detect open services. This confirmed my Windows firewall is actively filtering unsolicited inbound traffic rather that just relying on default seetings. It also showed me why real attackers/pentesters often can't get much from a single scan against a well-defened host-- they'd need other techniques(social engineering, looking for other unpatched hosts, etc. to make progress,
but on the downside, an agressively filtered host also makes legitimate troublshooting/asset management harder -- if I forgot this device was mine, the scan alone wouldn't tell me much about what it does on the network. There's trade off between security and visibility.
