---
layout: post
title: "10 Ways to Bypass WAF"
categories: [Notes, Web Security]
tags: [web-security, waf]
slug: "ways-to-bypass-waf" #url/posts/pageurl
image: /assets/img/blog/notes/web-security/cve20249405/waflogo.png  # Optional - add an image for the post
published: true  # Set to false if you want it unpublished
---

# 10 Ways to Bypass WAF

---

# 1. **Payload Encoding and Obfuscation**

Common encoding techniques are:

- Hex encoding : char —> hex equivalent
- Base64 encoding : entire payload —> base64 string
- URL encoding : certain char —> %xx format (xx = hex format)

Example: 

```bash
SELECT * FROM users WHERE id = 1;
```

Encoding payload in hexdecimal: 

```bash
%53%45%4C%45%43%54%20%2A%20%46%52%4F%4D%20%75%73%65%72%73%20%57%48%45%52%45%20%69%64%20%3D%201;
```

Server may process valid SQL but sometimes WAF doesn’t decode payload correctly.

# 2. HTTP Parameter Pollution

It involves sending multiple parameters with the same name in a single request. 

Many WAF expect only 1 occurence of each parameter, so 2nd or subsequent parameter may be ignored. And attacker can exploit this by inserting malicious values in additional parameters

Example:

```bash
GET /login?username=admin&password=admin123&password=mailicious_payload
```

WAF only inspect one parameter still server can process 2nd and subsequent parameter.

# 3. Case Tranformation

Change case of payload so that WAF unable to recognize anomaly.

Example:

```bash
SELECT * FROM users WHERE username = 'admin';
```

Attacker send this:

```bash
SeLeCt * FrOm users WhErE username = 'admin';
```

# 4. IP Fragmentation

how data transmitted over networks

Break payload into smaller fragment, so that smaller fragment bypass WAF and then resemble at server side for attack.

Example:

Instead of send complete HTTP request 

send multiple IP packets

```bash
GET /fragments/part1
GET /fragments/part2
```

# 5. JSON & XML Payloads

Modern web app use SOAP or REST API to transmit data in JSON or XML format. 

Many WAF not fully inspect content of XML or JSON

Example:

```bash
{
	"username" : "admin",
	"password" : "<script>alert('XSS')</script>"
}
```

# 6. Session Awareness Bypassing

Some WAFs are stateless and treat each request independently.

Attacker can bypass this by sending multiple request by sending normal look payload first then malicious one.

Example:

1. **Request 1**: GET /login
2. **Request 2**: POST /login (valid credentials)
3. **Request 3**: POST /profile?id=1'; DROP TABLE users;--

# 7. 404 bypassing

Target non existing page which has less security check by WAF

Example:

```bash
GET /nonexistentpage?payload=<script>alert('XSS')</script>
```

# 8. DNS Based Attacks

Many WAF is domain specific that is they analyze traffic from specific domain.

Attacker can directly send requests directly to server by avoid WAF’s domain-based filter.

Example:

```bash
GET <http://example.com/login>
```

Instead of this attacker can send:

```bash
GET <http://192.168.1.1/login>
```

# 9. Rate Limiting Bypass

Example:

Instead of sending burst amount of request, attacker can spread their request across botnets of hundreds of IP address which can bypass rate-limiting rules.

# 10. Exploiting Zero-Day Vulnerabilities

Zero-day vulnerabilites is unpatched flaw in software that is unknown to the vendor at the time of attack.

As WAF rely on predefined rules or pattern, it may not identify or block zero-day exploits. 


### New Concept:

1. *CDN stands for Content Delivery Network*
    
    It is a geographically distributed group of servers that caches content close to end users