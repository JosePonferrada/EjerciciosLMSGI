<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    <xsl:template match="/ligaVoleibol">
        <html>
            <head>
                <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
                <title><xsl:value-of select="@nombreLiga"/> de <xsl:value-of select="@pais"/></title>
                <style type="text/css">
                    <xsl:call-template name="css"/>
                </style></head>
            <body>
                
                <div style="width: 1000px; margin: 0 auto;" align="center">
                    
                    <h1><xsl:value-of select="@nombreLiga"/> de <xsl:value-of select="@pais"/></h1>
                   
                   
                    <!-- Tabla de equipos -->                    
                    <xsl:apply-templates select="clasificacion"></xsl:apply-templates>
                    
                    
                   <!-- Equipo con más puntos -->
                   <xsl:for-each select="clasificacion/equipo">
                       <xsl:sort select="number(@puntos)" order="descending"/>
                       <xsl:if test="position() = 1">
                       <h1>Equipo con más puntos:
                           <br/>
                           <xsl:variable name="imagenEquipo"><xsl:value-of select="@id"/></xsl:variable>
                           <img width="30px" src="{/ligaVoleibol/recursos/imagenes/img[@id = $imagenEquipo]}"/>
                               <xsl:value-of select="nombre"/> - <xsl:value-of select="@puntos"></xsl:value-of> puntos
                       </h1>
                       </xsl:if>
                   </xsl:for-each>
                    
                   
                   <!-- Mapa con equipos -->
                    <table width="100%" border="1" align="center" id="mapa"
                        style="background-image: url('{/ligaVoleibol/mapa/@imagen}')">
                        <xsl:call-template name="bucleForFila">
                            <xsl:with-param name="i">1</xsl:with-param>
                        </xsl:call-template>
                    </table>
                    
                    
                </div>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template name="bucleForFila">
        <xsl:param name="i"/>
        <xsl:if test="$i &lt;= 10">
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
        <xsl:if test="$j &lt;= 10">
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
        <td width="85px" height="60px">
            <xsl:for-each select="mapa/equipo">
                <xsl:if test="CoordenadaX/@valor = $x and coordenadaY/@valor = $y">
                    <xsl:choose>
                        <xsl:when test="$x mod 2 = 1">
                            <xsl:attribute name="style">background-color: purple;</xsl:attribute>
                        </xsl:when>
                        <xsl:otherwise>
                            <xsl:attribute name="style">background-color: pink;</xsl:attribute>
                        </xsl:otherwise>
                    </xsl:choose>
                    <xsl:variable name="imagenEquipo"><xsl:value-of select="@id"/></xsl:variable>
                    <img width="30px" src="{/ligaVoleibol/recursos/imagenes/img[@id = $imagenEquipo]}"/>
                    <xsl:variable name="nombreEquipo"><xsl:value-of select="@id"/></xsl:variable>
                    <xsl:value-of select="/ligaVoleibol/clasificacion/equipo[@id = $nombreEquipo]"/>
                </xsl:if>
            </xsl:for-each>
        </td>
    </xsl:template>
    
    
    <xsl:template match="clasificacion">
        
        <h2>Clasificación</h2>
        
        <table border="1" width="100%">
            <th>Imagen</th>
            <th>Nombre equipo</th>
            <th>Puntos</th>
            <th>Partidos jugados</th>
            <th>Ganados</th>
            <th>Perdidos</th>
            <th>Ganados menos perdidos</th>
            
            <xsl:for-each select="equipo">
                <xsl:sort select="nombre" order="ascending"/>
            
                <tr>
                    
                    <!-- Template para el color -->
                    <xsl:call-template name="colorDeFilas">
                        <xsl:with-param name="fila"><xsl:value-of select="position()"/></xsl:with-param>
                    </xsl:call-template>
                    
                    <!-- Imagen -->
                    <td>
                        <xsl:variable name="imagenEquipo"><xsl:value-of select="@id"/></xsl:variable>
                        <img width="30px" src="{/ligaVoleibol/recursos/imagenes/img[@id = $imagenEquipo]}"/>
                    </td>
                    <!-- Nombre equipo -->
                    <td><xsl:value-of select="nombre/."/></td>
                    <!-- Puntos -->
                    <td><xsl:value-of select="@puntos"/></td>
                    <!-- Partidos jugados -->
                    <td><xsl:value-of select="@Jugados"/></td>
                    <!-- Ganados -->
                    <td><xsl:value-of select="@ganados"/></td>
                    <!-- Perdidos -->
                    <td><xsl:value-of select="@perdidos"/></td>
                    <!-- Ganados menos perdidos -->
                    <td><xsl:value-of select="number(@ganados - @perdidos)"/></td>
                </tr>  
            </xsl:for-each>
            
        </table>
        
    </xsl:template>
    
    
    
    <xsl:template name="colorDeFilas">
        <xsl:param name="fila"/>
        <xsl:choose>
            <xsl:when test="$fila mod 3 = 1">
                <xsl:attribute name="style">background-color: lightblue;</xsl:attribute>
            </xsl:when>
            <xsl:when test="$fila mod 3 = 2">
                <xsl:attribute name="style">background-color: lightyellow;</xsl:attribute>
            </xsl:when>
            
        </xsl:choose>
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
        
       th {
        font-weight: bold;
        background-color: blue;
        color: white;
       }
       
       #mapa {
       background-size: cover;
       }
       
       table {
        margin-top: 50px;
        margin-bottom: 50px;
       }
       
        
        
    </xsl:template>
    
</xsl:stylesheet>