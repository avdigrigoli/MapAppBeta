<!DOCTYPE html>
<html>
<head>
  <title>Turf Circle Example</title>
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.3/dist/leaflet.css" />
  <script src="https://unpkg.com/leaflet@1.0.3/dist/leaflet.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.2/leaflet.draw.css"  />
  <script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/1.0.2/leaflet.draw.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@turf/turf@5/turf.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>

  <style>
    html, body,  #map {
      width : 100%;
      height : 100%;
    }
  </style>
</head>
<body>
<div id="map" ></div>
<script>

  var map = L.map('map').setView([42.736424, -73.762713], 10);

  var osm=new L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png',{
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'});
  osm.addTo(map);

  var editableLayers = new L.FeatureGroup();
  map.addLayer(editableLayers);

  var options = {
    position: 'topleft',
    collapsed: false,

    edit: {
      featureGroup: editableLayers,
      poly: {
        allowIntersection: false
      }
    },

    draw: {
      polygon: {
        allowIntersection: false,
        showArea: true
      }
    }

  };

  var drawControl = new L.Control.Draw(options);
  map.addControl(drawControl);

  map.on(L.Draw.Event.CREATED, function (e) {
    var layer = e.layer;
    var type = e.layerType;

    if (type === 'circle') {

      var theCenterPt = layer.getLatLng();

      var center = [theCenterPt.lng,theCenterPt.lat];
      console.log(center);

      var theRadius = layer.getRadius();

      editableLayers.addLayer(layer);

      // Turf Circle
     /* var turfCircle;
      var options = {steps: 64, units: 'meters'};  //Change steps to 4 to see what it does.
      var turfCircle = turf.circle(center, theRadius, options);
      var NewTurfCircle = new L.GeoJSON(turfCircle, {color:"black"}).addTo(map);

      //Turf Buffer
      var thepoint = turf.point(center);
      var buffered = turf.buffer(thepoint, theRadius, {units: 'meters'});
      var NewTurfBuffer = new L.GeoJSON(buffered, {color:"red"}).addTo(map);*/
    }
  });

</script>
</body>
</html>