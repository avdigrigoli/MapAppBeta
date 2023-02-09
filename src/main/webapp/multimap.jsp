<%--
  Created by IntelliJ IDEA.
  User: antho
  Date: 8/30/2022
  Time: 1:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Multi-Point Map test</title>

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css"
          integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ=="
          crossorigin=""/>

    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"
            integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ=="
            crossorigin=""></script>

    <!-- Load Esri Leaflet from CDN -->
    <script src="https://unpkg.com/esri-leaflet"></script>

    <!-- Esri Leaflet Geocoder -->
    <link rel="stylesheet" href="https://unpkg.com/esri-leaflet-geocoder/dist/esri-leaflet-geocoder.css"/>
    <script src="https://unpkg.com/esri-leaflet-geocoder"></script>

    <link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
    <script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
</head>

<style>
    body{margin:0; padding:0;}
    #mymap {position: absolute; top:0; bottom: 0; right: 0; left: 0;}
</style>
<body>
    <div id="mymap"></div>

    <script>
       /*var mymap = L.map('mymap').setView([40.91, -96.63], 4);

       L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
           attribution: '&copy; <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
       }).addTo(mymap);

       var searchControl = L.esri.Geocoding.geosearch().addTo(mymap);
       var results = L.layerGroup().addTo(mymap);

       searchControl.on('results', function(data){
           results.clearLayers();

           for(var i = data.results.length - 1; i>=0; i--){
               results.addLayer(L.marker(data.results[i].latlng));
           }
       })

        */

       var mymap = L.map('mymap').setView([0, 0], 2);
       L.tileLayer('https://{s}.tile.osm.org/{z}/{x}/{y}.png', {
           attribution: '&copy; <a href="https://osm.org/copyright">OpenStreetMap</a> contributors'
       }).addTo(mymap);
       L.Control.geocoder().addTo(mymap);



    </script>


</body>
</html>
