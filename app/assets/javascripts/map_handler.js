var map;
var infoWindow;
var markers;

function initMap() {
  console.log(markers);
  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: new google.maps.LatLng(40.601203,-8.668173) // some position
  });

  infoWindow = new google.maps.InfoWindow();

  google.maps.event.addListener(map, 'click', function() {
     infoWindow.close();
  });

  add_markers(markers)
}

function add_markers(markers){
  var bounds = new google.maps.LatLngBounds();

  markers.forEach(function(marker){
    latlng = new google.maps.LatLng(marker.lat, marker.lng)

    var mkr = new google.maps.Marker({
      position: latlng,
      map:      map,
      title:    marker.order_number
    });

    google.maps.event.addListener(marker, 'click', function() {
     var iwContent = '<div id="iw_container">' +
                     '<div class="iw_title">' + marker.order_number + '</div>' +
                     '</div>';

     infoWindow.setContent(iwContent);

     infoWindow.open(map, mkr);
    });

    bounds.extend(latlng);
  });

  map.fitBounds(bounds);
}
