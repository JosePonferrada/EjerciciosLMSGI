<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html" encoding="iso-8859-1"/>
    
    <xsl:template match="/gormitis">
      <html>
          <head>
              <title>Gormitis</title>
              <style type="text/css">
                  th{
                    background: #72a1ed;
                    color: #FFFFFF;
                    }
                  img{
                    width: 150px;
                    }
                  table{
                    width: 50%;
                    }
              </style>
          </head>
          <body>
              <table align="center">
                  <tr>
                      <th></th>
                      <th>Gormiti</th>
                      <th>Tribu</th>
                  </tr>
                  <xsl:call-template name="filasTabla"></xsl:call-template>
              </table>
          </body>
      </html>
    </xsl:template>
 
    <!--  -->
    <xsl:template name="filasTabla">
        <xsl:for-each select="gormiti">
             
         <tr>
             <xsl:if test="position() mod 2 = 1">
                 <xsl:attribute name="style">background: #72a1ed; </xsl:attribute>
             </xsl:if>
             <td><xsl:value-of select="position()"/></td>
             <td><img>
                 <xsl:attribute name="src"><xsl:value-of select="."/></xsl:attribute>
                 <!-- También se puede poner como <img src="{.}" -->
             </img></td>
             <td><xsl:value-of select="@tribu"/></td>
         </tr>
            
        </xsl:for-each>
        
    </xsl:template>
    
</xsl:stylesheet>