<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/callejero">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>Examen XSL - Callejero</title>
        <style type="text/css">
          <xsl:call-template name="css"/>
        </style></head>
      <body>
        
        <h1>
          <xsl:value-of select="@ciudad"/>, <xsl:value-of select="@barrio"/>, 
          <xsl:value-of select="@cod_postal"/>, <xsl:value-of select="@provincia"/>
          <br/>
          <img src="{imagen}"></img>
        </h1>
        
        <table>
          <tr>
            <td>Monumento</td>
            <td>Imagen</td>
            <td>Calle</td>
            <td>Calles anexas</td>  
          </tr>
          <xsl:for-each select="monumentos/monumento">
            <tr>
              <td><xsl:value-of select="@nombre"/></td>
            </tr>
          </xsl:for-each>
          
        </table>
          
        <xsl:apply-templates select="monumentos"></xsl:apply-templates>       
   
      </body>
    </html>
  </xsl:template>
  
  
  <!-- Template ap-b -->
  
  <xsl:template match="callejero">
    <h1>
      <xsl:value-of select="@barrio"/>
    </h1>
    <h2><xsl:value-of select="@nombre"/></h2>
    <h3><xsl:value-of select="@estreno"/></h3>
    <p></p>
  </xsl:template>  
  
  <xsl:template match="cartelera">
    <h1>Cartelera</h1>
    <xsl:for-each select="pelicula">
      <div class="card">
        <xsl:variable name="titulo"><xsl:value-of select="@id"/></xsl:variable>
        <img src="{/cine/imagenes/imagen[$titulo = @id]}" style="width:5%"/>
          <div class="container">
            <p></p>
            <h4><b><xsl:value-of select="@id"/></b></h4>
            <p></p>
          </div>
      </div> 
    </xsl:for-each>
   
  </xsl:template>
  
  
  <xsl:template match="monumentos">
    <table border="1" width="60%" align="center">
      <xsl:for-each select="monumento">
        <xsl:variable name="imagen"><xsl:value-of select="@imagen"/></xsl:variable>
        <xsl:variable name="calleAnexa"><xsl:value-of select="@calle"/></xsl:variable>        
          <tr align="center">
            <xsl:choose>
              <xsl:when test="position() mod 3 = 1"><xsl:attribute name="style">background: lightblue;</xsl:attribute></xsl:when>
              <xsl:when test="position() mod 3 = 2"><xsl:attribute name="style">background: orange;</xsl:attribute></xsl:when>
              <xsl:otherwise><xsl:attribute name="style">background: lime;</xsl:attribute></xsl:otherwise>
            </xsl:choose>
            <td><xsl:value-of select="@nombre"/></td>
            <td><img src="{/callejero/Imagenes/imagen[$imagen = @id]}"/></td>
            <td><xsl:value-of select="@calle"/></td>
            <td><xsl:value-of select="/callejero/callejero/calle[$calleAnexa = @nombre]/@anexas"/></td>
          </tr>
        
      </xsl:for-each>
      
    </table>
  </xsl:template>
  
  <xsl:template name="asientos">
    
      <xsl:for-each select=".">
        <xsl:call-template name="bucleForFila">
          <xsl:with-param name="i">1</xsl:with-param>
        </xsl:call-template>  
      </xsl:for-each>
      
  </xsl:template>
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 4">
      <tr>
        <xsl:call-template name="bucleForColumna">
          <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
          <xsl:with-param name="j">1</xsl:with-param>
        </xsl:call-template>
      </tr>
      <xsl:call-template name="bucleForFila">
        <xsl:with-param name="i"><xsl:value-of select="$i + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="bucleForColumna">
    <xsl:param name="i"/>
    <xsl:param name="j"/> 
    <xsl:if test="$j &lt;= 4">
      <xsl:call-template name="celda">
        <xsl:with-param name="x"><xsl:value-of select="$j"/></xsl:with-param>
        <xsl:with-param name="y"><xsl:value-of select="$i"/></xsl:with-param>
      </xsl:call-template>
      <xsl:call-template name="bucleForColumna">
        <xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
        <xsl:with-param name="j"><xsl:value-of select="$j + 1"/></xsl:with-param>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>
  
  
  <xsl:template name="celda">
    <xsl:param name="x"/>
    <xsl:param name="y"/>
    <td align="center">
      <xsl:choose>
        <xsl:when test="ocupado[$x = @asiento and $y = @fila]">
          <img src="{/cine/imagenes/imagen[@id = 'ocupado']}"/>
        </xsl:when>
        <xsl:otherwise>
          <img src="{/cine/imagenes/imagen[@id = 'libre']}"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
  </xsl:template>
  
  <xsl:template name="css">
    
    body {
    font-family: Arial;
    font-size: 12px;
    }
    
    img:hover {
    opacity: 0.8;
    scale: 1.1;
    
    }
    
    h1,h2,h3 {
    text-align: center;
    }
    
    .card {
    display: flex;
    justify-content: center;
    align-items; center;
    margin: 5px;
    
    }
    
    .container {
    display: block;
    margin: 5px;
    }
       
    
  </xsl:template>
  
</xsl:stylesheet>
