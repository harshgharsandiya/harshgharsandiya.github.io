---
layout: post
title: Psycho Break
date: 2024-07-07 13:00:00 +0000
categories: [CTF, TryHackMe]
tags: [ctf, tryhackme, blog]
excerpt: "This is the excerpt of CTF 2."
image: /assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled.webp
---

# Psycho Break

---

> Help Sebastian and his team of investigators to withstand the dangers that come ahead.
> 

> This room is based on a video game called evil within. I am a huge fan of this game. So I decided to make a CTF on it. With my storyline :). Your job is to help Sebastian and his team of investigators to withstand the dangers that come aheah.
> 

---

## Recon

1. How many ports are open?
- I run rustscan against IP to get active port in less time

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled.png)

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%201.png)

```bash
21,22,80
```

1. What is the operating system that runs on the target machine?
- I run nmap with -O option to enable OS detection

```bash
sudo nmap -O -p 21,22,80 $ip -vv
```

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%202.png)

- OS may be linux but i don’t get exact debian version of linux
- So i use -sV option to enable Version detection

```bash
nmap -sV -p 21,22,80 $ip -v
```

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%203.png)

- I found that ssh running on `Ubuntu` Linux with version `7.2p2`

---

## Web

1. Key to the looker room
- As port 80 is open i go to web page to gather some more information and found `/sadistRoom` directory at source code

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%204.png)

- When i go at above location, i found Key to locker Room: `532219a04ab7a02b56faafbec1a4c1ea`

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%205.png)

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%206.png)

1. Key to access the map
- After we have to enter key to locker room which we find earlier.

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%207.png)

- Here it say decode this `Tizmg_nv_zxxvhh_gl_gsv_nzk_kovzhv`  to get key to access the map.

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%208.png)

- So i use hash-identifier but no luck it cannot identify any encryption algo so i decided to go and give a try with online tool [https://www.dcode.fr/cipher-identifier](https://www.dcode.fr/cipher-identifier)

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%209.png)

- I get many cipher but most likely is top 3.
- So to decrypt it, I also use online tool for this.
- First i go with `Atbash Cipher:`  [https://www.dcode.fr/atbash-cipher](https://www.dcode.fr/atbash-cipher)

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2010.png)

- Lucky enough i get my key on first attempt.
- Key: `Grant_me_access_to_the_map_please`

1. The Keeper Key
- I enter key to access the map

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2011.png)

- Now i go to Safe Heaven to complete my next challenge.

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2012.png)

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2013.png)

- View source code and found something related to search so i think it has some hidden directories.

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2014.png)

- So I perform directory enumeration using `ffuf`
- If you don’t have `ffuf` in your linux machine just run below command to install it

```bash
git clone https://github.com/ffuf/ffuf ; cd ffuf ; go get ; go build ; sudo mv ffuf /usr/local/bin
```

- Now i run ffuf again $ip/SafeHeaven

```bash
ffuf -w /usr/share/wordlists/dirbuster/directory-list-2.3-medium.txt -u http://$ip/SafeHeaven/FUZZ -c -v -t 60 -ic
```

- I found one interesting directory keeper

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2015.png)

- I navigate to $ip/keeper and click on Escape Keeper.

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2016.png)

- I have less than 2 minutes time to get code to get key

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2017.png)

- Found Something interesting in source code. It say i have search this image on google.

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2018.png)

- I get `St.Augustine Lighthouse`

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2019.png)

- I enter and navigate to key page

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2020.png)

- Key: `48ee41458eb0b43bf82b986cecf3af01`

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2021.png)

1. What is the filename of the text file (without the file extension)
- I go to abandonedRoom and enter Keeper Key which we found above

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2022.png)

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2023.png)

- On click Go Further i redirect to below page

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2024.png)

- Source Code of above page has something interesting comments

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2025.png)

- Here it mention there is something like “shell” on current page. So i pass parameter in url with command as value like: /?shell=ls
- And yeah its working

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2026.png)

- We need file name so i guess it is located at previous directory as challenge also start from that directory so i run ls .. to see content of previous directory

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2027.png)

- But no luck it is not file as we expected but it looks like directory so i paste first segment that is `680e89809965ec41e64dc7e447f175ab`  and paste it into url. And we found something interesting that is we got file name i.e., `you_made_it`

![Untitled](/assets/img/blog/tryhackme/ctf/easy/Psycho Break/Untitled%2028.png)

---

## Help Me

> Coming Soon
>