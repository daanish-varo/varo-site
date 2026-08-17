#!/bin/sh
# Pre-publish check. Run from the repo root: sh check.sh
# Fails if placeholder markers, em-dashes, banned words, or Google Fonts
# links survive in the shipped files.
set -u
fail=0
files="index.html styles.css script.js"

if grep -n '\[\[BEN:' index.html; then echo "FAIL: [[BEN: marker present"; fail=1; fi
if grep -n '—' index.html; then echo "FAIL: em-dash in index.html"; fail=1; fi
if grep -n 'fonts.googleapis.com\|fonts.gstatic.com' $files; then echo "FAIL: Google Fonts link"; fail=1; fi
if grep -n -i -w 'transform\|transformation\|unlock\|journey\|synergy\|disrupt\|revolutionary\|cutting-edge\|next-gen\|paradigm\|AI-powered' index.html; then echo "FAIL: banned word"; fail=1; fi
if grep -n -i 'hello@varo.team' index.html; then echo "FAIL: hello@ does not exist yet"; fail=1; fi
if grep -n -i 'Varo Team' index.html | grep -v -i 'Varo Team, LLC'; then echo "FAIL: 'Varo Team' outside the footer legal line"; fail=1; fi

[ $fail -eq 0 ] && echo "OK: checks passed"
exit $fail
