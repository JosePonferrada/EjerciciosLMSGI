<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
  <xsl:output method="html" encoding="iso-8859-1"/>
  <xsl:template match="/gormitis">
    <html>
      <head>
        <title>Gormitis</title>
        <xsl:call-template name="css"/>
      </head>
      <body>
        <h1>Gormitis</h1>
        <table border="1" with="60%" align="center">
	        <xsl:call-template name="bucleForFila">
	        	<xsl:with-param name="i">0</xsl:with-param>
	        </xsl:call-template>
        </table>
        
      </body>
    </html>
  </xsl:template>




  <xsl:template name="bucleForFila">
  	<xsl:param name="i"/>
  	<xsl:if test="$i &lt;= 2">
  		<tr>
	  		<xsl:call-template name="bucleForColumna">
	  			<xsl:with-param name="i"><xsl:value-of select="$i"/></xsl:with-param>
	  			<xsl:with-param name="j">0</xsl:with-param>
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
  	<xsl:if test="$j &lt;= 2">
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
  		<xsl:for-each select="/gormitis/tablero/gormitiEnMapa">
  			<xsl:if test="@x = $x and @y = $y">
          <xsl:value-of select="@tribu"/>
  			</xsl:if>
  		</xsl:for-each>
  	</td>
  </xsl:template>





  <xsl:template name="css">
    <style type="text/css">
      body {
      margin: 50px;
      padding: 0px;
      background: #2372DE;
      font-family: 'Open Sans', sans-serif;
      font-size: 11pt;
      color: #FFFFFF;
      text-align:center;
      }    
      
      img {
      width: 200px;	
      }
      
      .tituloTabla {
      text-align:center;
      padding:15px;
      background-color:#330099;
      font-weight:bold;
      }
      
    </style>
  </xsl:template>

</xsl:stylesheet>
