<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

  <xsl:template match="properties">
  <listadonos>
    <xsl:for-each select="property">
      <ownerprop>
        <xsl:attribute name="id">
          <xsl:value-of select="@id"/>
        </xsl:attribute>
        <xsl:attribute name="city">
          <xsl:value-of select="@city"/>
        </xsl:attribute>
        <xsl:attribute name="Street">
          <xsl:value-of select="@Street"/>
        </xsl:attribute>
        <xsl:attribute name="pnumber">
          <xsl:value-of select="@pnumber"/>
        </xsl:attribute>
        <xsl:attribute name="value">
          <xsl:value-of select="@value"/>
        </xsl:attribute>
      </ownerprop>
      
    </xsl:for-each>
  </listadonos>

  </xsl:template>
    
</xsl:stylesheet>
