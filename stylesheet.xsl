<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns="http://www.w3.org/1999/xhtml"
    id="xslt-project-template"
    version="1.0">

    <xsl:param name="pageTitle" select="'Default Title'"/>

    <xsl:output
        method="xml"
        indent="yes"
        encoding="UTF-8"
        omit-xml-declaration="yes"/>

    <xsl:template match="/">
        <!-- Add DOCTYPE.  See https://stackoverflow.com/q/3387127 -->
        <!-- xslint-disable-next-line using-disable-output-escaping -->
        <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;
</xsl:text>
        <html>
            <head>
                <title><xsl:value-of select="$pageTitle"/></title>
            </head>
            <body>
                <h1><xsl:value-of select="$pageTitle"/></h1>
            </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
