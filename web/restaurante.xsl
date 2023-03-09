<?xml version="1.0" encoding='utf-8'?>
<!--Archivo XSL especifico para el apartado restaurante-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  	<xsl:template match='/reservaeventos'>
    <html lang="es">
		<head>
			<link href="../css/estilo.css" rel="stylesheet" type="text/css"/>
			<meta charset="utf-8"/>
			<meta name="description" content="Página principal"/>
			<title>titulo de la web</title>
		</head>
		<body>
			<header>
				<img src="../img/logotipo.png" alt="Reservas"/>
				<a href="teatro.xml">Teatro</a>
				<a href="restaurante.xml">Restaurante</a>
				<a href="festival.xml">Festival</a>
			</header>
			<main>
				<xsl:variable name="resNom" select='restaurante/nombrerestaurante'/>
				<h1>
					<a href="{restaurante/informacion}" target="_blank">
					<xsl:value-of select='$resNom'/>
					<xsl:value-of select='restaurante/ciudad'/>
					</a>
				</h1>
				<xsl:for-each select="restaurante">
					<xsl:if test="position()=1">
					<xsl:for-each select="menu">
						<article class="restaurante">
						<h3><xsl:value-of select='@tipo'/></h3>
						<xsl:for-each select="plato">
							<p><xsl:value-of select='.'/></p>
						</xsl:for-each>
						</article>
					</xsl:for-each>
					</xsl:if>
				</xsl:for-each>
			</main>
			<footer>
				<address>&#169; 2020 desarrollado por info@birt.eus</address>
			</footer>
		</body>
    </html>
  	</xsl:template>
</xsl:stylesheet>