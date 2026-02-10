#  System Health Manager

**System Health Manager** is an automated Bash script designed for Linux. It streamlines system maintenance, updates, and monitoring into a single, easy-to-use interface.

##  Features

* ** System Update:** Automatically updates and upgrades the system core and packages using `apt update` and `full-upgrade`.
* ** Smart Disk Monitoring:** Analyzes the root file system and triggers a critical warning if free space falls below 1GB.
* ** Log Cleaning:** Frees up valuable disk space by removing old log archives (`.gz`), vacuuming systemd journals (>3 days), and clearing package manager caches.
* ** Automation:** Manages all maintenance tasks through a user-friendly, interactive menu.

##  Installation & Usage

To use this script, clone the repository and run it with root privileges:

```bash
git clone [https://github.com/taylandenizdev/System-Health-Manager.git](https://github.com/taylandenizdev/System-Health-Manager.git)
cd System-Health-Manager
chmod +x System_Health_Manager.sh
sudo ./System_Health_Manager.sh
