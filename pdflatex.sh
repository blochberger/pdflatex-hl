#!/bin/bash -eu

# Increase line length of `pdflatex` output.
export max_print_line=1000

# Taken from:
# https://florian-weingarten.com/blog/2012/colored-pdflatex-console-output/

# There is no `-P` option for BSD `grep`. Use `pcregrep` instead, install via:
#
#     brew install pcre

# For the use of LC_CTYPE for uniq, see
# http://stackoverflow.com/a/18953848/5082444

GREP="pcregrep --color=always --line-buffered"

(/Library/TeX/texbin/pdflatex -file-line-error "$@" 2>&1) \
	| $GREP --invert-match "^\s*((\[|\]|\(|\))\s*)+$" \
	| PCREGREP_COLOR="00;32" $GREP "^Output written on .*\.pdf \(.*\)\.$|$" \
	| PCREGREP_COLOR="00;31" $GREP "(^[^:]*:\d+: )|(^l\.\d+ )|(^! LaTeX Error: )|$" \
	| PCREGREP_COLOR="00;33" $GREP "(LaTeX Warning(:|))|(Package [^\s]+ Warning(:|))|$" \
	| PCREGREP_COLOR="00;35" $GREP "Package [^\s]+ Message(:|)|$" \
	| LC_CTYPE=C uniq # Removes superfluous empty lines
