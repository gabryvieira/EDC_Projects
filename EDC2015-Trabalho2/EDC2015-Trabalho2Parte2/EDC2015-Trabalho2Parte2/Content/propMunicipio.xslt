﻿<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl"
>
    <xsl:output method="xml" indent="yes"/>

    <xsl:template match="properties">
      <listamunicipios>
      <xsl:for-each select="property">
        <city>
          <xsl:attribute name="cidadeteste">
            <xsl:value-of select="@city"/>
          </xsl:attribute>
        </city>
      </xsl:for-each>
      </listamunicipios>
        
    </xsl:template>
</xsl:stylesheet>
