<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>
  <xsl:param name="day" select="''"/>
  <xsl:param name="venueId" select="''"/>
  <xsl:param name="performerId" select="''"/>

  <xsl:template match="/festival">
    <xsl:variable name="filtered" select="events/event[(string-length($day) = 0 or date = $day) and (string-length($venueId) = 0 or venueRef = $venueId) and (string-length($performerId) = 0 or performerRef = $performerId)]"/>
{
  "filters": {
    "day": "<xsl:value-of select="$day"/>",
    "venueId": "<xsl:value-of select="$venueId"/>",
    "performerId": "<xsl:value-of select="$performerId"/>"
  },
  "total": <xsl:value-of select="count($filtered)"/>,
  "items": [
<xsl:for-each select="$filtered">
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
    }<xsl:if test="position() != last()">,</xsl:if>
</xsl:for-each>
  ]
}
  </xsl:template>
</xsl:stylesheet>
