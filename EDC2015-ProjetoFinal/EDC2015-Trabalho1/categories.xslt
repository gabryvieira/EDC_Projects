<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="xml" indent="yes"/>
    <xsl:template match="categories">
      <categories>
        <xsl:for-each select="category">
          <category>
            <xsl:attribute name="categoria">
              <xsl:value-of select="categoria"/>
            </xsl:attribute>
            <xsl:attribute name="imagem">
              <xsl:value-of select="imagem"/>
            </xsl:attribute>
          </category>
        </xsl:for-each>
      </categories>
    </xsl:template>
</xsl:stylesheet>
