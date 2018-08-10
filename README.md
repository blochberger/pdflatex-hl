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
- The path to the original `pdflatex` is not detected automatically, but still hard-coded in order to avoid calling the wrapper (which probably occurs first in `PATH`). The path currently is `/Library/TeX/texbin/pdflatex` – the default path of `pdflatex` if you are using [MacTeX](https://tug.org/mactex/).