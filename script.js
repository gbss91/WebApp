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
*** REFERENCE: https://github.com/tristen/tablesort 
Use tablesorter puglin to make the table sortable
**********************************************/

$(document).ready(function() 
    { 
        $(".table-mobile").tablesorter(); 
    } 
); 

/**********************************************
*** END OF REFERENCE: https://github.com/tristen/tablesort 
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




