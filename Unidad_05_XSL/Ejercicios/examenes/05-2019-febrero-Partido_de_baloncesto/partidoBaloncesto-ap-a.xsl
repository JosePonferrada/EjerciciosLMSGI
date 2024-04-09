<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/partidoBaloncesto">
    <html>
      <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>
        <title><xsl:value-of select="@nombre"/></title>
        <style type="text/css">
          <xsl:call-template name="css"/>
        </style></head>
    <body>
        <div style="width: 1000px; margin: 0 auto;">
          <h1 align="center">Baloncesto: Baloncesto Lucena 2 - Unicaja Baloncesto</h1>
          <table border="1" width="100%">
            <tr>
              <th>Equipo</th>
              <th>Jugador</th>
              <th>Dorsal</th>
              <th>Apodo</th>
              <th>Puntos</th>
              <th>Rebotes</th>
              <th>Asistencias</th>
            </tr>
            <tr>
              
              <xsl:for-each select="equipo">
                <xsl:call-template name="equipo">
                  <xsl:with-param name="imagen"><xsl:value-of select="@imagen"/></xsl:with-param>
                </xsl:call-template>
              </xsl:for-each>
              
            
            </tr>
            
          </table>
          <p/>
          <p/>
          <table width="100%" style="background: url('recursos/pista.jpg') no-repeat;"
            id="tablaCancha">
            <tr>
              <td/>
              <td><img src="recursos/cbcLucena.png"/>Juan </td>
              <td/>
              <td/>
              <td/>
              <td/>
              <td><img src="recursos/Unicaja_CB.png"/>Silvia </td>
              <td/>
              <td/>
              <td/>
              <tr>
                <td><img src="recursos/cbcLucena.png"/>Tania </td>
                <td/>
                <td/>
                <td><img src="recursos/cbcLucena.png"/>Antonio </td>
                <td/>
                <td/>
                <td/>
                <td/>
                <td/>
                <td/>
                <tr>
                  <td/>
                  <td/>
                  <td/>
                  <td/>
                  <td/>
                  <td><img src="recursos/Unicaja_CB.png"/>Mar </td>
                  <td/>
                  <td/>
                  <td/>
                  <td><img src="recursos/Unicaja_CB.png"/>Ainhoa </td>
                  <tr>
                    <td/>
                    <td/>
                    <td/>
                    <td/>
                    <td><img src="recursos/cbcLucena.png"/>Jaime </td>
                    <td/>
                    <td/>
                    <td><img src="recursos/Unicaja_CB.png"/>Luis </td>
                    <td/>
                    <td/>
                    <tr>
                      <td/>
                      <td/>
                      <td><img src="recursos/cbcLucena.png"/>Esther </td>
                      <td/>
                      <td/>
                      <td/>
                      <td/>
                      <td/>
                      <td><img src="recursos/Unicaja_CB.png"/>Chicho </td>
                      <td/>
                    </tr>
                  </tr>
                </tr>
              </tr>
            </tr>
          </table>
          <p/>
          <p/>
          <table align="center" border="1" width="50%">
            <tr>
              <th>Tiempo</th>
              <th>Jugador</th>
              <th>Apodo</th>
              <th>Descripcion</th>
              <th>Icono</th>
            </tr>
            <tr>
              <td>0:12</td>
              <td>Jaime</td>
              <td>Arquero</td>
              <td>Entrada a canasta y falta personal</td>
              <td>
                <img src="recursos/canasta.jpg"/>
              </td>
            </tr>
            <tr>
              <td>0:33</td>
              <td>Ainhoa</td>
              <td>Cara de niña</td>
              <td>Triple</td>
              <td>
                <img src="recursos/canasta.jpg"/>
              </td>
            </tr>
            <tr>
              <td>0:58</td>
              <td>Antonio</td>
              <td>Araña</td>
              <td>Falta personal</td>
              <td>
                <img src="recursos/falta.jpg"/>
              </td>
            </tr>
            <tr>
              <td>1:00</td>
              <td>Chicho</td>
              <td>Capi</td>
              <td>Dos tiros libres anotados</td>
              <td>
                <img src="recursos/canasta.jpg"/>
              </td>
            </tr>
            <tr>
              <td>1:18</td>
              <td>Mar</td>
              <td>Muralla</td>
              <td>Falta personal</td>
              <td>
                <img src="recursos/falta.jpg"/>
              </td>
            </tr>
            <tr>
              <td>2:20</td>
              <td>Esther</td>
              <td>Máquina</td>
              <td>Triple</td>
              <td>
                <img src="recursos/canasta.jpg"/>
              </td>
            </tr>
            <tr>
              <td>2:33</td>
              <td>Juan</td>
              <td>SuperJuan</td>
              <td>2 puntos</td>
              <td>
                <img src="recursos/canasta.jpg"/>
              </td>
            </tr>
          </table>
        </div>
    </body>
    </html>
  </xsl:template>
  
  
  
  
  <xsl:template name="equipo">
    <xsl:param name="imagen"/>
    <xsl:for-each select="jugador">
      <xsl:sort select="@nombre"></xsl:sort>
      
    <tr>
      
      <xsl:if test="position() mod 2 = 1">
        <xsl:choose>
          <xsl:when test="../@tipo = 'Local'">
            <xsl:attribute name="style">background:#d8e7ff;</xsl:attribute>
          </xsl:when>
          <xsl:otherwise>
            <xsl:attribute name="style">background:#d8ffcc;</xsl:attribute>
          </xsl:otherwise>
        </xsl:choose>
      </xsl:if>
      
      <td>
        <img src="{$imagen}"/>
      </td>
      
      <td><xsl:value-of select="@nombre"/></td>
      <td><xsl:value-of select="@dorsal"/></td>
      <td><xsl:value-of select="@apodo"/></td>
      <td><xsl:value-of select="@puntos"/></td>
      <td><xsl:value-of select="@rebotes"/></td>
      <td><xsl:value-of select="@asistencias"/></td>
        
    </tr>
    </xsl:for-each>
  </xsl:template>  
  
  
  <xsl:template name="css">
    
    body {
    font-family: Arial;
    font-size: 11px;
    }
    
    table img {
    width: 40px;
    }
    
    th {
    background: #1e3356;
    color: #FFFFFF;
    }
    
    #tablaCancha {
    color: #eff4fc;
    }
    
    ol, ul
    {
    margin-top: 10px;
    margin-left: 0px;
    }
    
    #menu li
    {
    margin-left: 0px;
    display: inline;
    list-style-type: none;
    padding: 10px 50px;
    }
    
    .noticia {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: left; 
    width: 338px;
    }
    
    .noticia img {
    width: 338px;
    }
    
    .noticiaDobleAncho {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: left; 
    width: 690px;
    }
    
    .noticiaDobleAncho img {
    width: 690px;
    }
    
    .fechaNoticia {
    color: #A3A34B;
    }
    
    .comentariosNoticia {
    color: #A3A34B;
    padding-left: 20px;
    }
    
    .divPublicidad {
    /* border: #000 solid 1px; */
    padding: 10px 5px;
    float: right; 
    width: 280px;                 
    }
    
    .divPublicidad img {
    width: 200px;
    }
      
    
  </xsl:template>
  
</xsl:stylesheet>
