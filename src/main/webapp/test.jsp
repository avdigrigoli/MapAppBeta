<html>
<head>
  <title>Pronatura Ver 50 km</title>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" type="image/x-icon" href="docs/images/favicon.ico" />
  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A==" crossorigin=""/>
  <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js" integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA==" crossorigin=""></script>
  <script language="javascript">
    var map;

    function init() {
       map = L.map('map', {doubleClickZoom: false, zoomControl: false}).locate({setView: true, zoom: 12, maxZoom: 16});
      // map = L.map('map', {zoomControl: false}).setView([40.7128, -74.0060], 4);

      L.control.zoom({
        position: 'topright'
      }).addTo(map);

       tiles = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}',{
        maxZoom: 20,
        subdomains:['mt0','mt1','mt2','mt3']
      }).addTo(map);

    }

    function onLocationFound(e) {
      var radius = e.accuracy / 2;
      var location = e.latlng
      L.marker(location).addTo(map)
      L.circle(location, radius).addTo(map);
    }

    function onLocationError(e) {
      alert(e.message);
    }

    function getLocationLeaflet() {
      map.on('locationfound', onLocationFound);
      map.on('locationerror', onLocationError);

      map.locate({setView: true, maxZoom: 16});
    }
  </script>

</head>
<body onLoad="javascript:init();">
<div id="map" style="height: 500px"></div>
<input type="button" value="Show My Location!" onClick="javascript:getLocationLeaflet();">

</body>
</html>