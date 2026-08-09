#!/bin/sh
# Run prettier on changed .xsl and .xslt files

set -Ceu

# Ensure packages have been locally installed to avoid plugin errors
# https://github.com/prettier/prettier/issues/15141
if ! [ -x node_modules/.bin/prettier ]; then
	npm install
fi

git diff -z --cached --name-only --diff-filter=AM |
	grep -z '\.xslt\?$' |
	xargs -0r npx prettier --
