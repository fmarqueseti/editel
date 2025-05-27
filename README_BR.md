# EDITEL

**EDITEL** é um editor de telas e gerador de código voltado para programadores GnuCOBOL.  
Este projeto é um *fork* do repositório original criado por Mauricio Valadão Vieira, disponível em:  
[https://sourceforge.net/projects/editel/](https://sourceforge.net/projects/editel/)

## 📌 Sobre o Projeto

Traduzir o design de uma tela para código COBOL pode ser uma tarefa demorada. Pensando nisso, o **EDITEL** foi desenvolvido como uma ferramenta que permite criar layouts de tela (incluindo uso de cores) com campos delimitados e máscaras de entrada, gerando automaticamente o código correspondente para a seção `SCREEN` do COBOL.

Originalmente concebido para sistemas **BLIS COBOL**, o EDITEL foi adaptado para funcionar com **GnuCOBOL** e **Micro Focus COBOL**.

## ⚙️ Funcionalidades

- Editor de telas com opções de Abrir / Salvar / Salvar Como.
- Suporte a 8 cores de primeiro plano e 8 cores de fundo.
- Interface WYSIWYG (What You See Is What You Get).
- Geração automática de código para a seção SCREEN do COBOL.
- Inclusão de campos de dados delimitados por colchetes `[ ]`, com qualquer máscara desejada.
- Código-fonte disponível em Turbo Pascal (`EDITEL.PAS`).
- Utilização gratuita, sem taxas de licença.

## 📷 Capturas de Tela

> Abaixo estão algumas imagens ilustrativas do EDITEL em funcionamento:

![](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.32.44-73a95790.png/245/183/1) ![](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.34.42-8e47d0d6.png/245/183/1) ![](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.35.11-a0697fb2.png/245/183/1)

*Exemplo de edição de layout de tela no EDITEL*

![Código COBOL gerado a partir do layout desenhado](https://a.fsdn.com/con/app/proj/editel/screenshots/Screenshot%202023-12-08%20at%2019.35.53-bb38d9b4.png/245/183/1)

## 📦 Arquivos Disponíveis

- [`EDITEL.EXE`](https://sourceforge.net/projects/editel/files/Version%201.0/EDITEL.EXE/download?use_mirror=master) — Executável principal (distribuído pelo sourceforge).
- [`EDITEL`](https://github.com/fmarqueseti/editel/blob/main/EDITEL) — Binário principal (compilado no Debian Linux).
- [`EDITEL.PAS`](https://github.com/fmarqueseti/editel/blob/main/EDITEL.PAS) — Código-fonte em Turbo Pascal.
- [`TELA.SCR`](https://github.com/fmarqueseti/editel/blob/main/TELA.SCR) — Arquivo de layout de tela exemplo.
- [`TELA.CPY`](https://github.com/fmarqueseti/editel/blob/main/TELA.CPY) — Código COBOL gerado com base no layout.

## 💻 Requisitos

- Ambiente MS-DOS, GNU Linux ou emulador compatível (exemplo: [DOSBox](https://www.dosbox.com/)).
- Para compilar o código-fonte: Turbo Pascal 7.0 ou Free Pascal Compiler (FPC).

## 📝 Créditos

Este repositório é um fork do projeto original criado por **Mauricio Valadão Vieira**.  
Versão original disponível em: [https://sourceforge.net/projects/editel/](https://sourceforge.net/projects/editel/)

