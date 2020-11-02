<?xml version="1.0" encoding="UTF-8"?>
<!--
   Web Application Development CA1
   
   Student Names: Student Names: Ruby Lennon (x19128355) & Gabriel Salas (x19104162)
   
   Date: 1 November 2020

   Filename:          products.xsl
   
   Supporting Files:
   products.xml
   products.xsd
   products.css
-->
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" doctype-system="about:legacy-compat" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Products</title>
<!-- declares products stylesheet -->
				<link href="products.css" rel="stylesheet" type="text/css"/>
			</head>
			<body>
				<header>
					<h1>Header goes here</h1>
					<h2>Sub header goes here</h2>
				</header>
				<section>
					<h1>Products List</h1>
<!-- selects product elements to apply template to-->
					<xsl:apply-templates select="products/product">
<!-- sorts product elements by name -->
						<xsl:sort select="name"/>
					</xsl:apply-templates>
				</section>
			</body>
		</html>
	</xsl:template>
<!-- template to be applied to each product element item -->
	<xsl:template match="product">
		<article>
			<h1>
				<xsl:value-of select="name"/>
			</h1>
			<h2>
<!-- code attribute -->
				Code:
				<xsl:for-each select="@code">
					[
					<xsl:value-of select="."/>
					]
				</xsl:for-each>
			</h2>
			<p>
<!-- category element -->
				Category:
				<span>
					<xsl:choose>
<!-- displays image icon based on product category -->
						<xsl:when test="category='Fantasy'">
							<img src="book.png" alt="book"/>
						</xsl:when>
						<xsl:when test="category='Cooking'">
							<img src="book.png" alt="book"/>
						</xsl:when>
						<xsl:when test="category='History'">
							<img src="book.png" alt="book"/>
						</xsl:when>
						<xsl:when test="category='Education'">
							<img src="book.png" alt="book"/>
						</xsl:when>
						<xsl:when test="category='Art'">
							<img src="film.png" alt="Visual Material"/>
						</xsl:when>
						<xsl:when test="category='Fiction'">
							<img src="film.png" alt="Visual Material"/>
						</xsl:when>
					</xsl:choose>
<!-- displays category element content -->
					<xsl:value-of select="category"/>
				</span>
			</p>
			<p>
<!-- displays descrfiption element content -->
				Description:
				<span>
					<xsl:for-each select="description">
						<xsl:value-of select="."/>.
					</xsl:for-each>
				</span>
			</p>
<!-- table -->
			<table>
				<tr>
<!-- table column headings -->
					<th>Quantity</th>
					<th>Unit Price</th>
				</tr>
				<tr>
<!-- table contents: quantity & unitPrice values -->
					<td>
						<xsl:value-of select="quantity"/>
					</td>
					<td>
						<xsl:value-of select="unitPrice"/>
					</td>
				</tr>
			</table>
		</article>
	</xsl:template>
</xsl:stylesheet>
