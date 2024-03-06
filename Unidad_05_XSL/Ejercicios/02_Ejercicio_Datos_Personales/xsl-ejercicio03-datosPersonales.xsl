<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/alumno">
      <html>
          <head>
              <title>Alumno</title>
          </head>
          <body>
              <h1>Info sobre el alumno</h1>
              <xsl:apply-templates></xsl:apply-templates>
          </body>
      </html>
    </xsl:template>
            
    <xsl:template match="nombre">
        <p>Nombre: <xsl:value-of select="."/>
        - DNI: <xsl:value-of select="../@dni"/></p>
    </xsl:template>        
    
    <xsl:template match="direccion">
        <p>Calle: <xsl:value-of select="calle"/></p>
        <p>Número: <xsl:value-of select="numero"/></p>
        <p>Ciudad: <xsl:value-of select="ciudad"/></p>
        <p>Provincia: <xsl:value-of select="provincia"/></p>
    </xsl:template>
    
    <xsl:template match="telefono">
        <p>Teléfono: <xsl:value-of select="."/></p>
    </xsl:template>
    
</xsl:stylesheet>