# `pdflatex` Highlighter

This is a wrapper for `pdflatex` which highlights errors, warnings and other information from the original `pdflatex` output.

![Screenshot](https://raw.githubusercontent.com/blochberger/pdflatex-hl/master/screenshot.png)

## Setup

```sh
pip install --upgrade -r requirements.txt
```

## Usage

Simply use it as a drop-in replacement for `pdflatex`.

## Caveats

- Messages on `stdout` and `stderr` of the original `pdflatex` are merged and everything will be written to `stdout`.

