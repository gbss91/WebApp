<?xml version="1.0"?>

<!--
   Web Application Development CA1
   
   Student Names: Ruby Lennon & Gabriel Salas 
   
   Date: 1 November 2020

   Filename:          productsstyle.xsl 
   Supporting Files:  products.xml / products.xsd
-->

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="html"/>


    <xsl:template match="/">
        <html>
        <body>
            <!-- Create a table -->
            <table border="1">
                
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
                    <td><xsl:value-of select="quantity"></xsl:value-of></td>
                    <td><xsl:value-of select="unitPrice"></xsl:value-of></td>ß
                </tr>
                </xsl:for-each>
                
            </table>  
            
        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>
