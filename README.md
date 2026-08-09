XSLT Project Template
=====================

[![Build Status](https://img.shields.io/github/actions/workflow/status/kevinoid/xslt-project-template/ci-xslt.yml?branch=main&style=flat&label=build)](https://github.com/kevinoid/xslt-project-template/actions/workflows/ci-xslt.yml?query=branch%3Amain)
[![XSLT Version](https://img.shields.io/badge/XSLT_Version-1.0.svg?style=flat)](https://en.wikipedia.org/wiki/XSLT#History)

A project template for [Extensible Stylesheet Language Transformation
(XSLT)](https://wikipedia.org/wiki/XSLT) projects, representing
[my](https://github.com/kevinoid) current preferences.  My projects are forked
from this template, allowing easy merging of updates across all of my
projects.

I am not advocating for these choices nor this template specifically, although
I am happy to discuss or explain any choices made herein.  It is being
published both for my own convenience and in case it may be useful to others
with similar tastes.


## Features

- [Golden Master Testing](https://.wikipedia.org/wiki/Characterization_test)
  of transformation results with multiple XSLT processors.
- Validation with [xslint](https://github.com/xslint/xslint).
- Validation against [ndw RELAX NG
  grammars for XSLT stylesheets](https://github.com/ndw/xslt-relax-ng).
- Formatting with [Prettier for XML](https://github.com/prettier/plugin-xml).


## Usage

### Browsers

This stylesheet can be applied by adding an [xml-stylesheet processing
instruction](https://www.w3.org/TR/xml-stylesheet/) to the prolog section of
the input XML document, as described in [Transforming XML with XSLT on
MDN](https://developer.mozilla.org/docs/Web/XML/XSLT/Guides/Transforming_XML_with_XSLT):

```xml
<?xml-stylesheet type="application/xslt+xml" href="stylesheet.xsl"?>
```

Once the processing instruction has been added, browsers will show the result
of the transformation when viewing the document with a few caveats:

There are proposals to [remove XSLT from the web
platform](https://github.com/whatwg/html/issues/11523), supported by
[Firefox](https://github.com/whatwg/html/issues/11523#issuecomment-3149788558)
and
[WebKit](https://github.com/whatwg/html/issues/11523#issuecomment-3149280766),
which have been [covered on LWN](https://lwn.net/Articles/1034560/).  This
method may become increasingly restricted, or cease to work entirely, in the
future.

[Chrome intends to deprecate and remove XSLT from the
browser](https://developer.chrome.com/docs/web-platform/deprecating-xslt), and
has marked the APIs as deprecated in 143.  Although it is still supported in
Chrome 151 (2026-08-06), it will not be forever.  See the [current
status](https://chromestatus.com/feature/4709671889534976)).

[Firefox 68](https://www.firefox.com/en-US/firefox/68.0/releasenotes/) and
later treat `file:` URIs as unique origins ([Bug
1500453](https://bugzilla.mozilla.org/show_bug.cgi?id=1500453) to avoid
security risks ([Bug
1558299](https://bugzilla.mozilla.org/show_bug.cgi?id=1558299)).  This
[prevents `xml-stylesheet`s from loading for local
files](https://stackoverflow.com/q/65542487).  (A `Cross-Origin Request
Blocked` message is logged to the Browser Console.)  Although it can be worked
around by setting [`security.fileuri.strict_origin_policy =
false`](https://kb.mozillazine.org/Security.fileuri.strict_origin_policy), a
more secure option is to host the files on a web server (e.g. [local testing
server](https://developer.mozilla.org/en-US/docs/Learn_web_development/Howto/Tools_and_setup/set_up_a_local_testing_server)).

Also note that although `application/xhtml+xml` is the [registered media type
for XSLT](https://www.iana.org/assignments/media-types/application/xslt+xml),
[old browser versions (circa 2011) only recognized
`text/xsl`](https://www.w3.org/XML/2011/11/ssTests/).  Applications supporting
these old browsers, may consider using the non-standard `text/xsl` type.


### Tools

This stylesheet can be applied using various tools:

[xsltproc](https://gnome.pages.gitlab.gnome.org/libxslt/xsltproc.html) from
[libxslt](https://gitlab.gnome.org/GNOME/libxslt):

```sh
xsltproc --stringparam name value --output output.xml stylesheet.xsl input.xml
```

[Saxon](https://saxon.sourceforge.net/):

```sh
saxon-xslt -o output.xml input.xml stylesheet.xsl name=value
```

[Xalan](https://xalan.apache.org/):

```sh
xalan -in input.xml -xsl stylesheet.xsl -param name value -out output.xml
```

And likely other XSLT processors using similar invocations.


## Parameters

| Name            | Description                                              |
| --------------- | -------------------------------------------------------- |
| pageTitle       | `<title>` and `<h1>` of the output XHTML.                |


## Standards

Some [publications from the W3 XML Core Working
Group](https://www.w3.org/XML/Core/#Publications) which may be useful for
developers:

- [XSL Transformations (XSLT) Version 1.0](https://www.w3.org/TR/xslt-10/)
  (with [XML Path Language (XPath) Version
  1.0](https://www.w3.org/TR/xpath-10/))
- [XSL Transformations (XSLT) Version 2.0](https://www.w3.org/TR/xslt20/)
  (with [XML Path Language (XPath) 2.0](https://www.w3.org/TR/xpath20/))
- [XSL Transformations (XSLT) Version 3.0](https://www.w3.org/TR/xslt-30/)
  (with [XML Path Language (XPath) 3.0](https://www.w3.org/TR/xpath-30/) or
  [XML Path Language (XPath) 3.1](https://www.w3.org/TR/xpath-31/))
- [Associating Style Sheets with XML
  documents](https://www.w3.org/TR/xml-stylesheet/)
- [Extensible Markup Language (XML) 1.0](https://www.w3.org/TR/xml/)
  (with [Namespaces in XML 1.0](https://www.w3.org/TR/REC-xml-names/))
- [Extensible Markup Language (XML) 1.1](https://www.w3.org/TR/xml11)
  (with [Namespaces in XML 1.1](https://www.w3.org/TR/xml-names11))
- [XML Schema](https://www.w3.org/XML/Schema):
  - [XML Schema Part 0: Primer](https://www.w3.org/TR/xmlschema-0/)
  - [XML Schema Part 1: Structures](https://www.w3.org/TR/xmlschema-1/)
  - [XML Schema Part 2: Datatypes](https://www.w3.org/TR/xmlschema-2/)
  - [W3C XML Schema Definition Language (XSD) 1.1 Part 1:
    Structures](https://www.w3.org/TR/xmlschema11-1/)
  - [W3C XML Schema Definition Language (XSD) 1.1 Part 2:
    Datatypes](https://www.w3.org/TR/xmlschema11-2/)


## Contributing

Contributions are appreciated.  Contributors agree to abide by the [Contributor
Covenant Code of
Conduct](https://www.contributor-covenant.org/version/1/4/code-of-conduct.html).
If this is your first time contributing to a Free and Open Source Software
project, consider reading [How to Contribute to Open
Source](https://opensource.guide/how-to-contribute/)
in the Open Source Guides.

If the desired change is large, complex, backwards-incompatible, can have
significantly differing implementations, or may not be in scope for this
project, opening an issue before writing the code can avoid frustration and
save a lot of time and effort.


## License

This project is available under the terms of the [MIT License](LICENSE.txt).
See the [summary at TLDRLegal](https://tldrlegal.com/license/mit-license).

The [template](https://github.com/kevinoid/xslt-project-template) upon which
this project is based is available under the terms of
[CC0 1.0 Universal](https://creativecommons.org/publicdomain/zero/1.0/).
