---
layout: post
title: "1 Subdomain Enumeration"
categories: [Tools, Subdomain]
tags: [tool, subdomain]
slug: "subdomain-enumeration" #url/posts/pageurl
image: /assets/img/blog/notes\oscp/recon/1.png  # Optional - add an image for the post
published: true  # Set to false if you want it unpublished
---

# Subdomain

---

### 1.1 Recon-ng

Framework like Metasploit for find subdomains

```powershell
recon-ng

use use recon/domain-hosts/

show options

set source example.com
```

All subdomains store in `hosts` and to see it:

```powershell
show hosts
```

If some subdomains are not given IP automatically, run

```powershell
use recon/hosts-hosts/resolve
run
```

### 1.2 Google Dorks

```powershell
site:*.example.com

#exclude specific domain
site:example.com -site:help.example.com
```

### 1.3 Reverse DNS-lookup

If you have IP range of target so first check which host is active then find out domain address of that host IP using custom bash script.

Let say I have IPs of target in onlylps.txt.

```powershell
#!/bin/bash
while read p; do
	echo $p;
	host $p
done <onlyIps.txt

```