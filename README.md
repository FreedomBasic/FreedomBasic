# Freedom BASIC

A BASIC interpreter and IDE for Windows and Linux, with a QB64-style mode.

Free to try for one year: full features, including .exe creation. After that: programs up to 1800 lines and no .exe creation, unless you have a license (not on sale yet).

## Download

Get the latest build from the **Releases** page (right side of this page).
Includes the 32-bit and 64-bit Windows versions, Linux, Freedom Designer and the bilingual (English/Greek) help.

## macOS (experimental, not released yet)

Freedom BASIC builds and runs on macOS (Apple Silicon and Intel) in automated tests: programs run and a QB-style window draws text and graphics correctly. Mouse, keyboard, menus and forms are not tested yet because I have no Mac. If you have a Mac and would like to test, please contact me on Discord.

## Known issues

**32-bit builds b699, b700 and the first b710: File > Open and File > Save did nothing** (fixed on 2026-11-19).
The 32-bit `FreedomBasic32.exe` of these releases reserved too much stack memory per thread, so the Windows file dialog could not start. The 64-bit version was not affected.
If you use the 32-bit version, please download `FreedomBasic32.exe` again from the **b710** release (the file there has been replaced with a fixed build; its SHA-256 is in the release text). The 32-bit files in b699 and b700 still have the problem.

## Overview

A short tour of what Freedom BASIC can do today, as images (no download needed): [slides](slides), starting with [01_cover.png](slides/01_cover.png).

## Welcome screen (optional)

`welcome.bas` is the start-up screen of the Windows IDE (New, Open, Recent files, Help).

1. Download [`welcome.bas`](welcome.bas).
2. Put it **next to `FreedomBasic64.exe`** (or `FreedomBasic32.exe`), or in a folder named `startup` next to the exe.
3. Start the IDE. The welcome screen opens in its own window.

Without the file the IDE works as usual, just without the welcome screen. To turn the screen off, delete the file or use "don't show again". You can edit `welcome.bas` freely; it is an ordinary Freedom BASIC program.

## Source code

The source code is private. For access, contact me on Discord.

## Community

https://discord.gg/PyZCR5UdXD

— Guslouk
