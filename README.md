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
of the transformation when viewing the document.

Note that [Chrome intends to deprecate and remove XSLT from the
browser](https://developer.chrome.com/docs/web-platform/deprecating-xslt) and
[other browser and standards bodies are discussing
removal](https://lwn.net/Articles/1034560/).

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
