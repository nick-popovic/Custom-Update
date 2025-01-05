# Custom-Update

## Background
I started this codebase in 2015 as I was taking some comp-sci courses. I was already using Linux as my daily driver and kept updating my programs using:

`sudo apt-get full-upgrade`

`sudo apt-get autoclean`

`sudo apt-get autoremove`

I thought while I was learning Bash to just write a simple script and run these commands in succession and eventually provide some kind of unified command to just issue an OS-specific `update` on the terminal and it just does everything.

Based on this commit history, clearly, I lofted hard and just stuck to my Linux (Debian) script and recently added MacOS support.

## Goal

In this new version, I intent to implement (attempt) a cross platform solution to handle Windows updates as well, but to do this, I need to migrate my codebase away from a bash script to some cross functional language.

Given that I'm using Go (and really loving it), I'll take a shot at doing it in GO language.