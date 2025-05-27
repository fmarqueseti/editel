# EDITEL

**EDITEL** is a screen editor and code generator designed specifically for GnuCOBOL developers.  
This project is a *fork* of the original repository created by Mauricio Valadão Vieira, available at:  
[https://sourceforge.net/projects/editel/](https://sourceforge.net/projects/editel/)

## 📌 About the Project

Manually translating screen layouts into COBOL `SCREEN` section code can be time-consuming and error-prone. **EDITEL** was built to streamline this process, offering a visual interface for designing screens (including color support and input masks), and automatically generating the corresponding COBOL code.

Originally designed for **BLIS COBOL**, the tool has been adapted for use with **GnuCOBOL** and **Micro Focus COBOL** environments.

## ⚙️ Key Features

- Screen editor with support for Open / Save / Save As operations.
- Palette with 8 foreground and 8 background colors.
- WYSIWYG interface (What You See Is What You Get).
- Automatic COBOL code generation for the `SCREEN` section.
- Support for data fields using brackets `[ ]`, with customizable input masks.
- Source code available in Turbo Pascal (`EDITEL.PAS`).
- Completely free to use — no licensing required.

## 📷 Screenshots

> Below are some illustrative screenshots of EDITEL in action:

![](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.32.44-73a95790.png/245/183/1)
![](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.34.42-8e47d0d6.png/245/183/1)
![](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.35.11-a0697fb2.png/245/183/1)

*Example of layout editing inside EDITEL*

![COBOL code generated from the visual layout](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.35.53-bb38d9b4.png/245/183/1)

## 📦 Available Files

- [`EDITEL.EXE`](https://sourceforge.net/projects/editel/files/Version%201.0/EDITEL.EXE/download?use_mirror=master) — Main executable (Windows/MS-DOS build).
- [`EDITEL`](https://sourceforge.net/projects/editel/files/Version%201.0/EDITEL.EXE/download?use_mirror=master) — Linux binary (compiled on Debian).
- [`EDITEL.PAS`](https://github.com/fmarqueseti/editel/blob/main/EDITEL.PAS) — Turbo Pascal source code.
- [`TELA.SCR`](https://github.com/fmarqueseti/editel/blob/main/TELA.SCR) — Sample screen layout file.
- [`TELA.CPY`](https://github.com/fmarqueseti/editel/blob/main/TELA.CPY) — COBOL copybook generated from the layout.

## 💻 Requirements

- MS-DOS, GNU/Linux terminal, or any compatible emulator (e.g. [DOSBox](https://www.dosbox.com/)).
- To compile the source: Turbo Pascal 7.0 or Free Pascal Compiler (FPC).

## 📝 Credits

This repository is a fork of the original project created by **Mauricio Valadão Vieira**.  
Original version available at: [https://sourceforge.net/projects/editel/](https://sourceforge.net/projects/editel/)

