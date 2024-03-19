<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/celebracion">
        <html>
            <head>
                <title><xsl:value-of select="@name"/></title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="menu">
        <xsl:for-each select="plato">
            <xsl:sort select="." order="ascending"/>
            <p style="font-weight: bolder">
                <xsl:value-of select="."/>
            </p>
        </xsl:for-each>
    </xsl:template>
    
    <xsl:template match="espirituosas">
        <h1>Espirituosas</h1>
        <xsl:apply-templates select="bebida">
            <xsl:sort select="@nombre" order="descending"/>
        </xsl:apply-templates>  
    </xsl:template>
    
    <xsl:template match="bebida">
        <p style="font-weight: bolder">
            <xsl:value-of select="@nombre"/>
        </p>
    </xsl:template>
    
</xsl:stylesheet>