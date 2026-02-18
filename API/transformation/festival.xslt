<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" encoding="UTF-8"/>

  <xsl:template match="/festival">
{
  "id": "<xsl:value-of select="meta/id"/>",
  "name": "<xsl:value-of select="meta/name"/>",
  "description": "<xsl:value-of select="meta/description"/>",
  "dates": {
    "start": "<xsl:value-of select="meta/dates/start"/>",
    "end": "<xsl:value-of select="meta/dates/end"/>"
  },
  "location": {
    "siteName": "<xsl:value-of select="meta/location/siteName"/>",
    "city": "<xsl:value-of select="meta/location/city"/>",
    "country": "<xsl:value-of select="meta/location/country"/>",
    "timezone": "<xsl:value-of select="meta/location/timezone"/>"
  },
  "links": {
    "website": "<xsl:value-of select="meta/links/website"/>",
    "tickets": "<xsl:value-of select="meta/links/tickets"/>",
    "instagram": "<xsl:value-of select="meta/links/instagram"/>",
    "facebook": "<xsl:value-of select="meta/links/facebook"/>"
  },
  "tickets": [
<xsl:for-each select="tickets/ticket">
    {
      "id": "<xsl:value-of select="@id"/>",
      "name": "<xsl:value-of select="name"/>",
      "tier": "<xsl:value-of select="tier"/>",
      "validDays": <xsl:value-of select="validDays"/>,
      "price": {
        "amount": <xsl:value-of select="price"/>,
        "currency": "<xsl:value-of select="price/@currency"/>"
      },
      "description": "<xsl:value-of select="description"/>"
    }<xsl:if test="position() != last()">,</xsl:if>
</xsl:for-each>
  ]
}
  </xsl:template>
</xsl:stylesheet>
