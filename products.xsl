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
			<!-- Link to stylesheet -->
            <link rel="stylesheet" type="text/css" href="style.css"/>
        </head> 
        <body>
            <!-- Create a table -->
            <table class="xslTable">
                <!-- First row with headers-->
                <tr>
					<th>Code</th>
					<th>Category</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Quantity</th>
                    <th>Unit Price</th>
                </tr>
                
                <!-- For each loop to select every product element-->
                <xsl:for-each select="products/product">
                <tr>
                    <td><xsl:value-of select="@code"></xsl:value-of></td>
                    <td><xsl:value-of select="category"></xsl:value-of></td>
                    <td><xsl:value-of select="name"></xsl:value-of></td>
                    <td><xsl:value-of select="description"></xsl:value-of></td>
                    <td class="center"><xsl:value-of select="quantity"></xsl:value-of></td>
                    <td class="center"><xsl:value-of select="unitPrice"></xsl:value-of></td>
                 </tr>
                 </xsl:for-each>
            </table>
</xsl:stylesheet>
