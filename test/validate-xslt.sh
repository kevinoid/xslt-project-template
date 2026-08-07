#!/bin/sh
# Check that a given XSLT file is valid according to a RELAX-NG schema.

set -Ceu

cache_dir=${XDG_CACHE_HOME:-$HOME/.cache}/validate-xslt

# TODO: Take multiple arguments and invoke jing once per version
if [ $# -ne 1 ]; then
	echo "Error: 1 argument is expected.  Got $#." >&2
	echo "Usage: $0 <xslt_file>" >&2
	exit 3
fi

version=$(xmllint --xpath 'string(/*/@version)' "$1") || exit $?
if [ -z "$version" ]; then
	echo "$1:: Missing xsl:stylesheet/@version" >&2
	exit 2
fi

case "$version" in
1.0)
	rnc_url=https://github.com/ndw/xslt-relax-ng/raw/refs/heads/master/1.0/xslt10.rnc
	rng=xslt10.rng
	;;
1.1)
	echo "$1:: There is no grammar for version 1.1, which was only a Working Draft" >&2
	exit 2
	;;
2.0)
	rnc_url=https://github.com/ndw/xslt-relax-ng/raw/refs/heads/master/2.0/xslt20.rnc xslt20.rng
	rng=xslt20.rng
	;;
3.0)
	# TODO: Compare to RELAX-NG schema from spec:
	# https://www.w3.org/TR/xslt-30/schema-for-xslt30.rnc
	rnc_url=https://github.com/ndw/xslt-relax-ng/raw/refs/heads/master/3.0/xslt30.rnc
	rng=xslt30.rng
	;;
*)
	echo "$1:: Unrecognized xsl:stylesheet/@version: $version"
	exit 2
	;;
esac

if ! [ -e "$cache_dir/$rng" ]; then
	mkdir -p "$cache_dir"
	trang "$rnc_url" "$cache_dir/$rng" || exit 4
fi

if ! jing "$cache_dir/$rng" "$1"; then
	echo "$1:: Failed RELAX NG validation against $rnc_url"
	exit 1
fi
