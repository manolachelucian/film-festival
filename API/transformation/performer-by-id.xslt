<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="id"/>

  <xsl:template match="/festival">
    <xsl:choose>
      <xsl:when test="performers/performer[@id = $id]">
        <xsl:for-each select="performers/performer[@id = $id]">
{
  "id": "<xsl:value-of select="@id"/>",
  "name": "<xsl:value-of select="name"/>",
  "category": "<xsl:value-of select="category"/>",
  "specialty": "<xsl:value-of select="specialty"/>",
  "country": "<xsl:value-of select="country"/>",
  "description": "<xsl:value-of select="description"/>"
}
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
{
  "error": {
    "code": "NOT_FOUND",
    "message": "Performer not found"
  }
}
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
