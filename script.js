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

/* Reference: https://github.com/tristen/tablesort 
Use tablesorter puglin to make the table sortable */

$(document).ready(function() 
    { 
        $(".table-mobile").tablesorter(); 
    } 
); 

/* End of Reference: https://github.com/tristen/tablesort 
Use tablesorter puglin to make the table sortable */


$('#start-button').click(function(){

    $('#calc1').hide();
    $('#calc2').show();


});

$('#calc-button').click(function(){

    var total;
    var tshirt = document.getElementById("tshirt").value;
    var jeans = document.getElementById("jeans").value;

    total = (tshirt * 2700) + (jeans * 10000);

    $('#calc2').hide();
    $('#calc3').show();
    $('#total').html(total + " Liters");
}
);

$('#reset-button').click(function(){

    $('#calc3').hide();
    $('#calc1').show();

    document.getElementById("tshirt").value = 0;
    document.getElementById("jeans").value = 0;

}
);




