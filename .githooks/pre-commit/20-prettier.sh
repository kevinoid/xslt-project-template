#!/bin/sh
# Run prettier on changed .xsl and .xslt files

set -Ceu

git diff -z --cached --name-only --diff-filter=AM |
	grep -z '\.xslt\?$' |
	xargs -0r npx prettier --
