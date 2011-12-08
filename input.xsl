<?xml version="1.0"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:output method="xml" />

 <xsl:template match="/">

  <test>
     <xsl:element name="first">
       <xsl:value-of select="'start'" />
     </xsl:element>
     <xsl:value-of select="/insert" />
  </test>

 </xsl:template>

</xsl:stylesheet>