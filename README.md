# Puppet Challenge: Mastering the Windows Agent

## Overview

This project demonstrates **Configuration Management using Puppet**.
A Puppet Master defines the **desired system state**, and a Windows Puppet Agent automatically enforces that state.

Instead of manually configuring machines, Puppet ensures that files, services, software, and configurations remain consistent across systems.

---

# Architecture

The setup uses **two systems**:

1. **Puppet Master**

   * Runs Puppet Server
   * Hosted inside a **Docker container**
   * Stores the configuration manifest (`site.pp`)

2. **Puppet Agent**

   * A **Windows machine**
   * Runs Puppet Agent
   * Applies configurations sent by the Puppet Master

```
Puppet Master (Docker)
        │
        │ Puppet Catalog
        ▼
Windows Agent
```

Command used on the Windows Agent:

```
puppet agent -t
```

---

# Technologies Used

* Puppet
* Docker
* Windows OS
* Chocolatey
* IIS Web Server
* Puppet Registry Module

---

# Puppet Manifest File

All configurations are defined in:

```
/etc/puppetlabs/code/environments/production/manifests/site.pp
```

This file defines the **desired state** of the Windows machine.

---

# Level 1: Digital Fingerprint

### Objective

Verify communication between Puppet Master and Agent.

### Task

Create a folder and file on the Windows system.

### Result

Folder created:

```
C:\PuppetMission
```

File created:

```
C:\PuppetMission\hello.txt
```

Content:

```
Puppet was here at Nayan Ghate
```

### Self-Healing Test

If the file is deleted and the agent runs again, Puppet automatically recreates it.

---

# Level 2: Service Lock

### Objective

Disable a Windows service for security.

### Task

Stop and disable the **Print Spooler service**.

Service affected:

```
Spooler
```

### Result

* Service is stopped
* Service cannot start automatically

Even if started manually, Puppet stops it again.

---

# Level 3: Secret Agent Registry

### Objective

Store configuration data in Windows Registry.

### Task

Create registry key:

```
HKLM\Software\PuppetMaster
```

Create registry value:

```
MissionStatus = Success
```

### Module Required

```
puppet module install puppetlabs-registry
```

---

# Level 4: Silent Installer

### Objective

Install software automatically without manual setup.

### Task

Install **Notepad++** using Chocolatey.

### Module Required

```
puppet module install puppetlabs-chocolatey
```

### Result

Notepad++ is installed automatically.

If the software is uninstalled manually, Puppet reinstalls it.

---

# Level 5: Identity Report (Facts)

### Objective

Generate a system information report using Puppet Facts.

### Task

Create file:

```
C:\PuppetMission\spec_report.txt
```

Example output:

```
This machine is running Windows and has 16 GB of RAM.
```

Each machine produces **different output depending on its hardware**.

---

# Boss Level: Self-Healing Website

### Objective

Deploy and maintain a web server automatically.

### Tasks

1. Install **IIS Web Server**
2. Create website file
3. Ensure web service is always running

Website file:

```
C:\inetpub\wwwroot\index.html
```

Example page:

```
Welcome to Nayan Ghate's Puppet Self-Healing Website
```

### Service Managed

```
W3SVC
```

### Self-Healing Test

If the webpage is edited manually, running Puppet restores the original page.

---

# Key Concept: Desired State Configuration

Puppet ensures that the system always remains in the **defined configuration state**.

Examples:

| Action Taken      | Puppet Response      |
| ----------------- | -------------------- |
| File deleted      | File recreated       |
| Service started   | Service stopped      |
| Registry modified | Value restored       |
| Software removed  | Software reinstalled |
| Website edited    | Website restored     |

---

# Learning Outcomes

* Understand Puppet Master-Agent architecture
* Automate Windows configuration
* Manage services and files using Puppet
* Install software automatically
* Use Puppet Facts for system data
* Implement self-healing infrastructure

---

# Conclusion

This project demonstrates how Puppet can automate system configuration and maintain consistent infrastructure across machines. By defining the desired state in code, systems become **self-healing, scalable, and easier to manage**.
