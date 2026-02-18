<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="page" select="1"/>
  <xsl:param name="pageSize" select="3"/>

  <xsl:template match="/festival">
    <xsl:variable name="total" select="count(performers/performer)"/>
    <xsl:variable name="pageNum" select="number($page)"/>
    <xsl:variable name="sizeNum" select="number($pageSize)"/>
    <xsl:variable name="startIndex" select="(($pageNum - 1) * $sizeNum) + 1"/>
    <xsl:variable name="endIndex" select="$pageNum * $sizeNum"/>
{
  "page": <xsl:value-of select="$pageNum"/>,
  "pageSize": <xsl:value-of select="$sizeNum"/>,
  "totalItems": <xsl:value-of select="$total"/>,
  "totalPages": <xsl:value-of select="ceiling($total div $sizeNum)"/>,
  "items": [
<xsl:for-each select="performers/performer[position() &gt;= $startIndex and position() &lt;= $endIndex]">
    {
      "id": "<xsl:value-of select="@id"/>",
      "name": "<xsl:value-of select="name"/>",
      "category": "<xsl:value-of select="category"/>",
      "specialty": "<xsl:value-of select="specialty"/>",
      "country": "<xsl:value-of select="country"/>",
      "description": "<xsl:value-of select="description"/>"
    }<xsl:if test="position() != last()">,</xsl:if>
</xsl:for-each>
  ]
}
  </xsl:template>
</xsl:stylesheet>
