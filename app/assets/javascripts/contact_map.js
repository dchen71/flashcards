//Google maps and marker
$(document).ready(function(){
  var hq = new google.maps.LatLng(37.789180,-122.390029);
    //Creates map and marker
    function initialize() {
      var mapProp = {
        center:hq,
        zoom:17,
        mapTypeId:google.maps.MapTypeId.ROADMAP
      };
      var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
      
      //Adds marker for location
      var marker = new google.maps.Marker({
        position:hq,
        });
      marker.setMap(map);
    }

    google.maps.event.addDomListener(window, 'load', initialize);

});