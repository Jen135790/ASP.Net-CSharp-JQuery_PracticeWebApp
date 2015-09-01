var main = function () {
    //Display Navigation:
    var links = ["Practice.aspx", "About.aspx", "Contact.aspx", "Feedback.aspx"];
    var linkText = ["Home", "About", "Contact", "Feedback"];
    
    for (var i = 0; i < links.length; i++) {
        $('<a class=\"siteLinks\" href=\"' + links[i] + '\">' + linkText[i] + '</a>').appendTo('nav');
    }

    //Display Footer:
    $('<p>\"Sea Shark Bank\" is a programming demonstration that is developed with ASP.Net/C#, HTML, CSS, and JQuery</p>').appendTo('footer');
    $('<p>Author: Jeanis Sananikone</p>').appendTo('footer');

};
$(document).ready(main);