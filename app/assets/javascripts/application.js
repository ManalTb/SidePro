//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require jquery-ui
//= require gmaps-auto-complete
//= require jquery.geocomplete.js


$(function(){

  $('#map').each(function(i,elt){
   
    map = new google.maps.Map(elt, {
      zoom: 19,
      center: new google.maps.LatLng(48.858565, 2.347198),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    function successCallBack(position){
      map.panTo(new google.maps.LatLng(position.coords.latitude, position.coords.longitude)); //centre la map sur de nouvelles coordonnées
      new google.maps.Marker({
        position: new google.maps.LatLng(position.coords.latitude, position.coords.longitude),
        map: map
      });
    }

    if (navigator.geolocation)
      navigator.geolocation.watchPosition(successCallBack, null,{enableHighAccuracy : true}); //utilisation du GPS pour coords ++ précises, delai de chargemt,                                    //duree de vie max d'une coordonnee envoyée par un user
    else
      alert("your browser is not allowed to access to your location");

  })
 

  $("#geocomplete").geocomplete();
  
  // Trigger geocoding request.
  $("button.find").click(function(){
    $("#geocomplete").trigger("geocode");
  });
  
  $("#geocomplete").geocomplete({ details: "form" });
});