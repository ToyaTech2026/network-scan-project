# Study Notes: Network Scan Project (Security+ SY0-701)

## What I Actually Did (in order)
1. Set up a Kali Linux VM with bridged networking so it had its own IP on my home LAN.
2. Cloned my GitHub project repo onto the VM using `git clone`.
3. Ran a host discovery scan (`nmap -sn`) to find live devices on my network.
4. Picked one discovered host and ran a port/service scan (`nmap -sV -O`) against it.
5. Interpreted the results, documented findings in a report, and pushed everything back to GitHub.

---

## Terminal Commands Learned

| Command | What it does |
|---|---|
| `pwd` | Prints the current folder you're in |
| `ls` | Lists files/folders in the current directory |
| `cd <folder>` | Moves into a folder |
| `cd ~` | Moves to your home folder |
| `chmod +x <file>` | Makes a file executable (runnable) |
| `./script.sh` | Runs a script located in the current folder (the `./` is required) |
| `nano <file>` | Opens a file in a simple text editor (Ctrl+O save, Ctrl+X exit) |
| `cat <file>` | Prints a file's contents to the screen |
| `sudo <command>` | Runs a command with admin/root privileges |
| `ip a` | Shows network interfaces and IP addresses |
| `git clone <url>` | Downloads a copy of a GitHub repo |
| `git add .` | Stages all changed files for commit |
| `git commit -m "message"` | Saves a snapshot of staged changes |
| `git push` | Uploads local commits to GitHub |

**Common mistake I made:** typing two commands on one line by accident (e.g. `cd folder && ls` merging wrong), and forgetting the `./` before a script name. Both cause "not found" style errors that look scary but are just syntax issues.

---

## Nmap Flags Used

| Flag | Meaning |
|---|---|
| `-sn` | Ping scan only — discover live hosts, don't scan ports |
| `-sV` | Detect service/version running on open ports |
| `-O` | Attempt OS detection (needs `sudo` to work reliably) |
| `-oN <file>` | Save output to a text file in normal format |
| `--script vuln` | Run vulnerability-detection scripts (optional, more advanced) |

---

## Key Finding & Interpretation
- Host discovery found live devices on `192.168.1.0/24`, including the router at `192.168.1.1`.
- Port scan against `192.168.1.124` returned **all 1000 scanned ports as "filtered"** — meaning the host's firewall silently dropped probes instead of responding open or closed.
- Because of this, Nmap couldn't reliably fingerprint the OS either (it just guessed a list of unrelated devices with low confidence).

## Security+ Concepts This Connects To
- **Defense in depth (3.0 Security Architecture):** a host-based firewall is its own layer of defense, separate from the network/router firewall.
- **Confidentiality vs. Availability/Usability tradeoff:** a well-filtered host is harder to attack, but also harder to legitimately monitor, inventory, or troubleshoot — security controls always have tradeoffs.
- **Reconnaissance (2.0 Threats, Vulnerabilities & Mitigations):** this is exactly the kind of passive/active recon step an attacker (or a pentester) would do first — asset discovery, then service enumeration — before attempting exploitation.
- **Asset inventory (4.0 Security Operations):** you can't secure what you don't know exists; host discovery is the foundational step.

## Lesson Learned (in my own words)
My firewall is configured correctly — it's blocking unsolicited probing rather than exposing services by default. This showed me firsthand why attackers can't always get useful info from a single scan against a hardened host, and why "filtered" is often a good sign rather than a failure. It also showed me the tradeoff: a well-defended host gives me less visibility too, if I ever needed to check on it myself.

---

## How I'd Explain This Project in an Interview (practice answer)
> "I set up a Kali Linux VM and used it to run a network security assessment against my own home network as a hands-on project while studying for Security+. I did host discovery to inventory live devices, then ran a service/port scan against one host. I found that the host's firewall was filtering all scanned ports, which told me the firewall was configured correctly — and it also taught me about the tradeoff between security and visibility, since a well-defended host is harder to monitor too. I documented the whole process and findings in a report and pushed it to GitHub."

## Next Steps to Practice More
- Scan a *different* device (phone, smart TV, printer) to see open ports for comparison — most IoT devices are much less locked down.
- Try `--script vuln` against a host to see what a basic vulnerability scan reports.
- Research 2-3 real CVEs for any service/version you do find open, to practice reading CVE details.
- Set up a second, deliberately vulnerable VM (e.g. Metasploitable2) to scan safely and see what an "open" result actually looks like.
