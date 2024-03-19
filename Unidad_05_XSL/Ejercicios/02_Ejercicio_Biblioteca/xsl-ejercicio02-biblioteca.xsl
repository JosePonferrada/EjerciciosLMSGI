<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/biblioteca">
        <html>
            <head>
                <title>Biblioteca</title>
            </head>
            <body>
                <xsl:apply-templates/>
            </body>
        </html>
    </xsl:template>
        
    <xsl:template match="libro">
                
            <table border="1">
                <tr class="tituloTabla">
                    <td><xsl:value-of select="titulo"/></td>
                    <td><xsl:value-of select="autor[@fechaNacimiento]/autor"/></td>
                </tr>
                <tr>
                    <td><xsl:value-of select="autor"/></td>
                    <td><xsl:value-of select="fechaPublicacion"/></td>
                </tr>
                
            </table>
            <br/>
         
    </xsl:template>
    
    
</xsl:stylesheet>