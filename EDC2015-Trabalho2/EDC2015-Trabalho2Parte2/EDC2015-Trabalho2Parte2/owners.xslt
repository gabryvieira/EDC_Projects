<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
   <xsl:output indent="yes"/>
  <xsl:template match="properties">
    <properties>
      <xsl:for-each select="property">
        <property>
          <xsl:attribute name="fname">
            <xsl:value-of select="owner/@fname"/>
          </xsl:attribute>
          <xsl:attribute name="lname">
            <xsl:value-of select="owner/@lname"/>
          </xsl:attribute>
          <xsl:attribute name="nif">
            <xsl:value-of select="owner/@nif"/>
          </xsl:attribute>
          <xsl:attribute name="pdate">
            <xsl:value-of select="owner/@pdate"/>
          </xsl:attribute>
          <xsl:attribute name="id">
            <xsl:value-of select="../@id"/>
          </xsl:attribute>
        </property>
      </xsl:for-each>
    </properties>
  </xsl:template>
</xsl:stylesheet>
