/*
Web Application Development CA1
   
Student Names: Student Names: Ruby Lennon (x19128355) & Gabriel Salas (x19104162)
   
Date: 4 November 2020

Filename: script.js
   
Supporting Files:
index.html
about.html
mission.html
contact.html
search.html
products.xsl

*/

/**********************************************
*** @REFERENCE: https://github.com/tristen/tablesort 
Use tablesorter puglin to make the table sortable
**********************************************/

$(document).ready(function() 
    { 
        $(".table-mobile").tablesorter(); 
    } 
); 

/**********************************************
*** END OF @REFERENCE: https://github.com/tristen/tablesort 
Use tablesorter puglin to make the table sortable
**********************************************/


/**********************************************
*** HOME PAGE CALCULATOR 
**********************************************/

//Defines the function for the start button 
$('#start-button').click(function(){
    //Hide the HTML block with the first screen and then shows the second screen 
    $('#calc1').hide();
    $('#calc2').show();


});

//Defines the functon of calculate button 
$('#calc-button').click(function(){

    var total;
    var tshirt = document.getElementById("tshirt").value; //Assign value of input field using HTML DOM without jquery
    var jeans = document.getElementById("jeans").value; //Assign value of input field using HTML DOM without jquery

    //Calculates amount of water used to produce items. Water consumption data from UN and WWF 
    total = (tshirt * 2700) + (jeans * 10000);

    //Hides second screen using jquery and show last screen with total 
    $('#calc2').hide();
    $('#calc3').show();
    $('#total').html(total + " Liters"); //Targets the HTML tag with this class and adds HMTL with total and String "Liters"
});

//Defines the functon of reset button 
$('#reset-button').click(function(){
    //When clicking reset, it will hide the last screen and show the first one again
    $('#calc3').hide(); 
    $('#calc1').show();
    
    //This will reset the values on the #calc2 input fields to null. Used null instead of 0 to show placehorder text again. 
    document.getElementById("tshirt").value = null;
    document.getElementById("jeans").value = null;

});

/**********************************************
*** SEARCH PAGE
**********************************************/

//Resets input value in search box when page loads
$(document).ready(function() {
    $('#search-box').val(null);
})

//Store XML file in variable 
var xmlFile = 'products.xml';

//Calls the search function when clicking the button 
$('#search-btn').click(search);  

//Search function. This is called when clicking search button 
function search() {
    var input = $('#search-box').val();

    //Alert if there is no input
    if (input == null || input == ""){
        alert('Please enter name or code.'); 
        return; //This exit from method instead of continuing with the rest 
    }

    //Calls function to get XMLDoc
    getXMLDocObject(xmlFile, function(xmlDoc) {

        //Extract info from xmlDoc object 
        var products = xmlDoc.getElementsByTagName('products')[0];
        var product = products.getElementsByTagName('product');
        var found = false;

        //Traverse products searching for code 
        for(var i = 0; i < product.length; i++) {
            var code = product[i].attributes[0].value;

            if(input === code) { 

                $('#product-img').attr('src', 'img/' + code + ".jpg"); //Add image src to img tag in HTML
                $('#code').html(code); //Adds code to the <p> tag in the HMLT to print it on screen

                var name = product[i].children[1].innerHTML; //Gets name value using the XML DOM 
                $('#name').html(name); //Adds name to the <h4> tag in the HMLT to print it on screen 

                var category = product[i].children[0].innerHTML; //Gets category value using the XML DOM 
                $('#category').html(category); //Adds product to the <p> tag in the HMLT to print it on screen

                var description = product[i].children[2].innerHTML; //Gets description value using the XML DOM 
                $('#description').html(description); //Adds description to the <p> tag in the HMLT to print it on screen

                var quantity = product[i].children[3].innerHTML; //Gets quantity value using the XML DOM 
                $('#quantity').html('Quantity: ' + quantity); //Adds quantity to the <p> tag in the HMLT to print it on screen

                var price = product[i].children[4].innerHTML; //Gets price value using the XML DOM 
                $('#price').html('Unit price: ' + price); //Adds price to the <p> tag in the HMLT to print it on screen

                found = true; //This will be used for the alert 
            }
        }

        //Traverse products searching for name
        for(var i = 0; i < product.length; i++) {
            var name = product[i].children[1].innerHTML;
            var code = product[i].attributes[0].value;

            if(name.toLowerCase() === input.toLowerCase()) { 

                $('#product-img').attr('src', 'img/' + code + ".jpg"); //Add image src to img tag in HTML
                $('#code').html(code); //Adds code to the <p> tag in the HMLT to print it on screen

                $('#name').html(name); //Adds name to the <h4> tag in the HMLT to print it on screen 

                var category = product[i].children[0].innerHTML; //Gets category value using the XML DOM 
                $('#category').html(category); //Adds product to the <p> tag in the HMLT to print it on screen

                var description = product[i].children[2].innerHTML; //Gets description value using the XML DOM 
                $('#description').html(description); //Adds description to the <p> tag in the HMLT to print it on screen

                var quantity = product[i].children[3].innerHTML; //Gets quantity value using the XML DOM 
                $('#quantity').html('Quantity: ' + quantity); //Adds quantity to the <p> tag in the HMLT to print it on screen

                var price = product[i].children[4].innerHTML; //Gets price value using the XML DOM 
                $('#price').html('Unit price: ' + price); //Adds price to the <p> tag in the HMLT to print it on screen

                found = true; //This will be used for the alert 
            }

        }

        if(!found) {
            alert('No product found!'); //Alerts user when no product is found 
        }

    });
    
}


//Function to get file document with AJAX XMLHttpRequest 
function getXMLDocObject(xmlFile, callback) { 
    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
        if( (this.readyState === 4) && (this.status === 200) ) { //The request is finished and the status is OK
            var xmlContent = this.responseText;
            var xmlDoc = parseXML(xmlContent);
            callback(xmlDoc); //Callback to pass function as argument later 
        }
    };
    request.open('GET', xmlFile, true);
    request.send();
}

//Parse the XML into an XML DOM object
function parseXML(xmlContent) {
    var parser = new DOMParser();
    var xmlDoc = parser.parseFromString(xmlContent, 'text/xml');
    return xmlDoc
}

