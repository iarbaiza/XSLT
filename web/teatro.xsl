<?xml version="1.0" encoding="UTF-8"?>
<!--Archivo XSL especifico para el apartado teatro-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:template match='/reservaeventos'>
  <html lang="es">    
    <head>
      <link href="./css/estilo.css" rel="stylesheet" type="text/css"/>
      <meta charset="utf-8"/>
      <meta name="description" content="Página principal"/>
      <title>titulo de la web</title>
    </head>
    <body>
      <header>
        <img src="../img/logotipo.png" alt= "Reservas"/>
        <a href="teatro.xml">Teatro</a>
        <a href="restaurante.xml">Restaurante</a>
        <a href="festival.xml">Festival</a>
      </header> 
      <main class="principal">
        <section class="teatro">
          <h1>PROXIMAS OBRAS DE TEATRO</h1>
          <ul>
            <xsl:apply-templates select="//teatro">
            <xsl:sort order="descending" select="fechahora/@dia"/>
            </xsl:apply-templates>
            <xsl:apply-templates select="//teatro[obra/fechahora/@dia = '2023-01']">
            <xsl:sort order="descending" select="obra/fechahora/@dia"/>
            </xsl:apply-templates>						
          </ul>
        </section>
      </main>
      <footer>
        <address>&#169; 2020 desarrollado por info@birt.eus</address>
      </footer>
    </body>
  </html>
  </xsl:template>

  <xsl:template match="teatro">
    <head>
      <link type="text/css" rel="stylesheet" href="../css/estilo.css"/>
    </head>
    <html>
      <li>
        <xsl:choose>
          <xsl:when test="precio &lt; 20">
            <span class="subrayado">
              <xsl:value-of select="concat(fechahora/@dia, ': ', obra)"/>
            </span>
          </xsl:when>
          <xsl:otherwise>
            <xsl:value-of select="concat(fechahora/@dia, ': ', obra)"/>
          </xsl:otherwise>
        </xsl:choose>
      </li>
    </html>
  </xsl:template>
</xsl:stylesheet>