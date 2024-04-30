<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="html" encoding="iso-8859-1"/>

  <xsl:template match="/videoclub">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title>Examen - Videoclub</title>
        <style type="text/css">
          <xsl:call-template name="css"/>
        </style>
      </head>
      <body>
        <div>
          <h1><xsl:value-of select="@nombre"/></h1>
        </div>
        <!-- Tabla Videojuegos - Peliculas -->
        <div>
          <table border="1" align="center" width="60%">
            <tr>
              <xsl:attribute name="style">background-color: darkblue; color: white;</xsl:attribute>
              <td>Título</td>
              <td>Pegi</td>
              <td>Duración/Plataforma</td>
              <td>Alquiler diario</td>
            </tr>
            <xsl:apply-templates select="Peliculas"/>
            <xsl:apply-templates select="videojuegos"/>
          </table>
        </div>
        <br/>
        <!-- Mapa Estanteria -->
        <div>
          <table border="1" align="center">
            <xsl:call-template name="bucleForFila">
              <xsl:with-param name="i">1</xsl:with-param>
            </xsl:call-template>
          </table>
        </div>
        <br/>
        <!-- Videojuego más caro / Pelicula más corta -->
        <div>
          <p>
            El videojuego más caro es <xsl:call-template name="videojuego"/>
          </p>
          <p>
            La película más corta es <xsl:call-template name="pelicula"/>
          </p>
        </div>
      </body>
    </html>
  </xsl:template>
  
  <xsl:template name="bucleForFila">
    <xsl:param name="i"/>
    <xsl:if test="$i &lt;= 5">
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
    <xsl:if test="$j &lt;= 5">
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
    <td>
      <xsl:for-each select="videojuegos/videoJuego">
        <!-- Las coordenadas del XML están intercambiadas -->
        <xsl:if test="@y = $x and @x = $y">
          <!-- Color Celda Videojuego-->
          <xsl:attribute name="style">background-color: #<xsl:value-of select="/videoclub/bancoDeImagenes/color[@identificador = 'videojuegos']"/>;</xsl:attribute>
          <!-- Imagen Videojuego -->
          <xsl:variable name="imgVideo"><xsl:value-of select="idImg/@valor"/></xsl:variable>
          <img width="150px" height="125px" src="{/videoclub/bancoDeImagenes/imagen[@identificador = $imgVideo]}"></img>
          <!-- Datos Videojuego -->
          <p><xsl:value-of select="."/></p>
          <p>Pegi: <xsl:value-of select="@pegi"/></p>
          <p>Precio: <xsl:value-of select="@alquilerDiario"/></p>
        </xsl:if>
      </xsl:for-each>
      <xsl:for-each select="Peliculas/pelicula">
        <!-- Las coordenadas del XML están intercambiadas -->
        <xsl:if test="coordenadas/@y = $x and coordenadas/@x = $y">
          <!-- Color Celda Pelicula -->
          <xsl:attribute name="style">background-color: #<xsl:value-of select="/videoclub/bancoDeImagenes/color[@identificador = 'peliculas']"/>;</xsl:attribute>
          <!-- Imagen Pelicula -->
          <xsl:variable name="imgPeli"><xsl:value-of select="@idimg"/></xsl:variable>
          <img width="150px" height="125px" src="{/videoclub/bancoDeImagenes/imagen[@identificador = $imgPeli]}"></img>
          <!-- Datos Pelicula -->
          <p><xsl:value-of select="@titulo"/></p>
          <p>Pegi: <xsl:value-of select="@pegi"/></p>
          <p>Precio: <xsl:value-of select="@alquilerDiario"/></p>
        </xsl:if>
      </xsl:for-each>
    </td>
  </xsl:template>
  
  <!-- Template Pelicula más corta -->
  <xsl:template name="pelicula">
    <xsl:for-each select="Peliculas/pelicula">
      <xsl:sort select="@duracionEnMinutos" order="ascending"/>
      <xsl:if test="position() = 1">
        <xsl:value-of select="@titulo"/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Template Videojuego más caro -->
  <xsl:template name="videojuego">
    <xsl:for-each select="videojuegos/videoJuego">
      <xsl:sort select="@alquilerDiario" order="descending"/>
      <xsl:if test="position() = 1">
        <xsl:value-of select="."/>
      </xsl:if>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Template Videojuegos -->
  <xsl:template match="videojuegos">
    <xsl:for-each select="videoJuego">
      <xsl:sort select="@order" order="ascending"/>
      <tr>
        <xsl:choose>
          <xsl:when test="position() mod 2 = 0">
            <xsl:attribute name="style">background-color: lightgreen;</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="style">background-color: green;</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <td><xsl:value-of select="."/></td>
        <td><xsl:value-of select="@pegi"/></td>
        <td><xsl:value-of select="@plataforma"/></td>
        <td><xsl:value-of select="@alquilerDiario"/></td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Template Peliculas -->
  <xsl:template match="Peliculas">
    <xsl:for-each select="pelicula">
      <xsl:sort select="@order" order="ascending"/>
      <tr>
        <xsl:choose>
          <xsl:when test="position() mod 2 = 0">
            <xsl:attribute name="style">background-color: lightyellow;</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="style">background-color: yellow;</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
        <td><xsl:value-of select="@titulo"/></td>
        <td><xsl:value-of select="@pegi"/></td>
        <td><xsl:value-of select="@duracionEnMinutos"/></td>
        <td><xsl:value-of select="@alquilerDiario"/></td>
      </tr>
    </xsl:for-each>
  </xsl:template>
  
  <!-- Template CSS -->
  <xsl:template name="css">
    body {
      text-align: center;
      font-size: 20px;
    }
  </xsl:template>
    
</xsl:stylesheet>

