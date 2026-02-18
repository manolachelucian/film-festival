<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="id"/>

  <xsl:template match="/festival">
    <xsl:choose>
      <xsl:when test="events/event[@id = $id]">
        <xsl:for-each select="events/event[@id = $id]">
          <xsl:variable name="venue" select="/festival/venues/venue[@id = current()/venueRef]"/>
          <xsl:variable name="performer" select="/festival/performers/performer[@id = current()/performerRef]"/>
{
  "id": "<xsl:value-of select="@id"/>",
  "title": "<xsl:value-of select="title"/>",
  "date": "<xsl:value-of select="date"/>",
  "startTime": "<xsl:value-of select="startTime"/>",
  "endTime": "<xsl:value-of select="endTime"/>",
  "venue": {
    "id": "<xsl:value-of select="venueRef"/>",
    "name": "<xsl:value-of select="$venue/name"/>"
  },
  "performer": {
    "id": "<xsl:value-of select="performerRef"/>",
    "name": "<xsl:value-of select="$performer/name"/>"
  },
  "description": "<xsl:value-of select="description"/>"
}
        </xsl:for-each>
      </xsl:when>
      <xsl:otherwise>
{
  "error": {
    "code": "NOT_FOUND",
    "message": "Event not found"
  }
}
      </xsl:otherwise>
    </xsl:choose>
  </xsl:template>
</xsl:stylesheet>
