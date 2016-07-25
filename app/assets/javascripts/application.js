//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require gmaps-auto-complete
//= require jquery.geocomplete.js


console.log('fichier parsé')
$(function(){
console.log('dom loaed')
$("#geocomplete").geocomplete();

// Trigger geocoding request.
$("button.find").click(function(){
  $("#geocomplete").trigger("geocode");
});

$("#geocomplete").geocomplete({ details: "form" });

});
