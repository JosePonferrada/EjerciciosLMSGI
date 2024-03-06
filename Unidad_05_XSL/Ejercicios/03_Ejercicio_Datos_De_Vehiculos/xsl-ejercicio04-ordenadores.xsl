<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/ordenadores">
      <html>
          <head>
              <title>Ordenadores</title>
          </head>
          <body>
              <xsl:apply-templates></xsl:apply-templates>
          </body>
      </html>
    </xsl:template>
            
    <xsl:template match="ordenador">
        <table border="1">
            <thead><xsl:value-of select="procesador"/></thead>
            <tr>
                <td>RAM</td>
                <td><xsl:value-of select="capacidad"/></td>
            </tr>
        </table>
    </xsl:template>        
    
    
</xsl:stylesheet>