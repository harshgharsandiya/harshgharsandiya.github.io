---
layout: post
title: "1 Information Gathering"
categories: [OSCP, InfoGathering]
tags: [oscp, recon]
slug: "info-gathering" #url/posts/pageurl
image: /assets/img/blog/notes\oscp/recon/1.png  # Optional - add an image for the post
published: true  # Set to false if you want it unpublished
---

# Information Gathering

---

1. Passive Recon : No direct interaction with target
2. Active Recon : direct interaction 

# Passive Recon

### 1.1 WHOIS Lookup

Find domain ownership details, registrar info, and expiry dates.

Basic information about domain by passing domain name and IP of our who is server.

```powershell
whois megacorpone.com -h 192.168.50.251
```

Reverse lookup

```powershell
whois 38.100.193.70 -h 192.168.50.251
```

### 1.2 Google Dorking

site operator limit searches to single domain

```powershell
site: megacorpone.com
```

filetype operator limit searches to specific file type

```powershell
site: megacorpone.com filetype:txt
```

ext operator limit searches  to specific extension such as `.php`, `.xml` ,`.py` 

```powershell
site: megacorpe.com ext:php
```

`-` specify to exclude something

Find non-html pages

```powershell
site: megacorpone.com -filetype:html
```

intitle operator : contain “index of “ in the title and “parent directory” on the page.

> index refers to directory listing pages that list the file contents of the directories without index pages.
> 

```powershell
intitle: "index of" "parent directory"
```

- `Google Hacking Database` contain various creative searches.
- `DorkSearch` portal to experimenting Google Dork.

### 1.3 Robots.txt

It instructs web crawlers (i.e.,: Google search engine crawler) to allow or disallow specific resources.

```powershell
www.megacorpone.com/robots.txt
```

```powershell
User-agent: *
Allow: /
Allow: /nanites.php
```

### 1.4 Open-Source Code

> Github, Github Gist, GitLab, SourceForge
> 
- Provide information about programming languages and framewords
- Sensitive Data Exposure

Github:

1. Search any files with word “users” in name.

```powershell
filename:users
```

1. Search any file belons to specific user.

```powershell
user: megacorpone filename:users
```

While Manual method is best for small repo. 

For larger repo, use Automated Tools

> Require access Token of source-code hosting provider’s API
> 

> This kind of tools regl on regex or extropy based detection
> 
1. Gitrob
2. Gitleaks

```powershell
gitleaks detect -v -r=http:github.com/REDACTED.git
```

### 1.5 Shodan

- Search engine that crawls devices connected to internet, including servers that run websites, devices like routers and IOT devices.

> IPs, services, and banner information. All of this is gathered passively, avoiding interacting with the client’s web site
> 

To search specific hostname

```powershell
hostname:megacorpone.com
```

We found ports on left pane under Top Ports

To search based on port

```powershell
hostname:megacorpone.com port:"22"
```

Here we know exactly which version of OpenSSH running on web server.

By clicking IP we can get summary of host that tells port, services and technology used.

### 1.6 Security Headers and SSL/TLS

This website is help to scan host for security headers.

https://securityheaders.com/

Security headers includes:

1. Content-Security-Policy 
2. X-Frame-Options 
3. X-Content-Type-Options 
4. Referrer-Policy 
5. Permissions-Policy

> Server Hardening is overall process of securing server via configuration by disabling unneeded services, removing unused services or user accounts, rotating passwords, setting appropriate server headers, etc.
> 

Another Scanning tool is  SSL Server Test from Qualys SSL Labs which analyze SSL/TLS configuration and compare it against current best practices. Also identify SSL/TLS related vulnerabilites such as `Poodle` or `HeartBleed`.

https://www.ssllabs.com/ssltest/