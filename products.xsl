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
        <html lang="en">
        <head>
		
			<!-- Required meta tags -->
			<meta charset="utf-8"/>
			<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
			
			<!-- Bootstrap CSS -->
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous"/>
             
            <!-- Google fonts -->
            <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400"/>
	
            <!-- Link to stylesheet -->
            <link rel="stylesheet" type="text/css" href="style.css"/>
            <link rel="stylesheet" type="text/css" href="products.css"/>
            
			<title>Products</title>
        </head>
		
        <body>	
		<!-- HEADER START -->
        <div class="container-fluid background-primary-color header sticky-top">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-12">
                        <!-- Navbar start -->
                        <nav class="navbar navbar-expand-lg navbar-light">
                            <!-- Navbar logo -->
                            <a class="navbar-brand d-flex justify-content-center" id="logo" href="index.html">
                                <img src="img/logo.png" alt="logo"> </img>
                            </a>
                            <!-- Navbar collapse button for responsive version-->
                            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                            <!-- Navbar menu -->
                            <div class="collapse navbar-collapse main-menu-item" id="navbarSupportedContent">
                                <ul class="navbar-nav">
                                    <li class="nav-item">
                                        <a class="nav-link" href="index.html">Home</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="about.html">About</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="mission.html">Our Mission</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="products.xml">Products</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" href="contact.html">Contact</a>
                                    </li>
                                </ul>
                            </div>
                            <!-- Search button and page -->
                            <div class="d-flex">
                                <a href="search.html">
                                    <ion-icon name="search"></ion-icon>
                                </a>
                            </div>
                        </nav>
                        <!-- Navbar end -->
                    </div>
                </div>
            </div>
        </div>
        <!-- HEADER END -->
		
        <!-- TITLE CONTAINER START -->
        <div class="container-fluid">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-12">
                        <div class="main-text">
                            <h1>Our Products</h1>
                            <p>All our products are made with organic and ethically sourced bamboo, cotton and wool.</p>
                        </div>     
                    </div>
				</div> 
			</div>    
		</div>
        <!-- TITLE CONTAINER ENDS -->
		
            <!-- Create a table -->
            <table class="table-mobile">
                <!-- First row with headers-->
                <thead>
                <tr>
                    <th></th>
					<th>Code &#9650;&#9660;</th>
					<th id="category">Category &#9650;&#9660;</th>
					<th></th>
                    <th>Name &#9650;&#9660;</th>
                    <th>Description</th>
                    <th>Quantity &#9650;&#9660;</th>
                    <th>Unit Price &#9650;&#9660;</th>
                </tr>
                </thead>
                
                <!-- For each loop to select every product element-->
                <tbody>
                <xsl:for-each select="products/product">
                <tr>
                    <td><img src="img/{@code}.jpg" class="product-img"/></td> <!-- Selects image matchig @code-->
                    <td class="center"><xsl:value-of select="@code"></xsl:value-of></td>
                    <td class="center"><xsl:value-of select="category"></xsl:value-of></td>
						<!-- displays image icon based on product category -->	
						<td class="center">					
							<xsl:choose>
								<xsl:when test="category='Tops'">
									<img src="icon/tshirt.png" alt="Tops" class="icon"/>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="category='Jeans'">
									<img src="icon/jeans.png" alt="Jeans" class="icon"/>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="category='Cardigans &amp; Jumpers'">
									<img src="icon/jumper.png" alt="Jumper" class="icon"/>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="category='Coats &amp; Jackets'">
									<img src="icon/coat.png" alt="Coat" class="icon"/>
								</xsl:when>
							</xsl:choose>
							<xsl:choose>
								<xsl:when test="category='Shoes'">
									<img src="icon/shoes.png" alt="Shoes" class="icon"/>
								</xsl:when>
							</xsl:choose>		
							<xsl:choose>
								<xsl:when test="category='Socks'">
									<img src="icon/socks.png" alt="Socks" class="icon"/>
								</xsl:when>
							</xsl:choose>								
						</td>
                    <td class="center" id="name"><xsl:value-of select="name"></xsl:value-of></td>
                    <td id="description"><xsl:value-of select="description"></xsl:value-of></td>
                    <td class="center"><xsl:value-of select="quantity"></xsl:value-of></td>
                    <td class="center"><xsl:value-of select="unitPrice"></xsl:value-of></td>
                 </tr>
                 </xsl:for-each>
                </tbody>

                 <!-- Icon image attribution -->
                <footer class="page-footer reference">
		            Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
                 </footer>
            </table>
				
        <!-- Loads icon framework from www.ionicons.com -->
        <script type="module" src="https://unpkg.com/ionicons@5.2.3/dist/ionicons/ionicons.esm.js" crossorigin="anonymous"></script> 
        <script type="module" src="script.js" crossorigin="anonymous"></script> 
        <script type="module" src="jquery.tablesorter.min.js"></script>
        <!-- Bootstrap script and jquery -->
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <!-- SCRIPT END -->
		
       
        </body>
        </html>
	</xsl:template>  
</xsl:stylesheet>
