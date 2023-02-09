<%@ page import="com.victrix.victrix.daos.mhpDao" %>
<%@ page import="com.victrix.victrix.models.mhpModel" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: anthony
  Date: 9/1/2022
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Styled Map</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/card.css">

  <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css"
          integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ=="
          crossorigin=""/>

    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"
            integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ=="
            crossorigin=""></script>

  <link rel="stylesheet" href="css/navbar.css">

</head>
<style>
  * {
    box-sizing: border-box;
  }

  .map{
    margin-top: 35px;
    margin-left: -70px;
    width: 100%;
    height: 70%;
    box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
    border-radius: 15px;
    background: rgba(255,255,255,0.1);
    overflow: hidden;
    display: flex;
    justify-content: center;
    align-items: center;
    border-top: 1px solid rgba(255,255,255,0.5);
    border-left: 1px solid rgba(255,255,255,0.5);
    backdrop-filter: blur(5px);
    z-index: 0;
  }
  /* Create two equal columns that floats next to each other */
  .column1 {
    float: left;
    width: 60%;
    padding: 10px;
  }

  .column2 {
    float: left;
    width: 40%;
    padding: 10px;
  }

  /* Clear floats after the columns */
  .row:after {
    content: "";
    display: table;
    clear: both;
  }

  /* Responsive layout - makes the two columns stack on top of each other instead of next to each other */
  @media screen and (max-width: 650px) {
    .column1,.column2 {
      width: 100%;
    }
    .map{
      margin-top: auto;
      margin-left: auto;
    }
  }

     /* width */
   ::-webkit-scrollbar {
     width: 20px;
   }

  /* Track */
  ::-webkit-scrollbar-track {
    box-shadow: inset 0 0 5px #112222;
    border-radius: 10px;
  }

  /* Handle */
  ::-webkit-scrollbar-thumb {
    background: #3e0e18;
    border-radius: 10px;
  }

  /* Handle on hover */
  ::-webkit-scrollbar-thumb:hover {
    background: #1f060b;
  }
</style>
<body>
<ul>
  <li><b>Home</b></li>
  <li><b>Add Account</b></li>
  <li><b>Add Data</b></li>
  <li><b>Logout</b></li>
</ul>

<br>

<h1 style="color: white; font-family: Poppins,sans-serif;
border-bottom: 1px solid white; width: 100%; max-width: 700px;
 margin-left: auto; margin-right: auto; text-align: center; padding-bottom: 20px">Properties</h1>

<div class="row">
  <div class="column1" style="scale: .9">
    <div class="container" style="direction: rtl; overflow: scroll; height: 95vh">
      <%   mhpDao pd = new mhpDao();
        List<mhpModel> products = pd.getAllProps();
        if(!products.isEmpty()){
          for(mhpModel p : products){
            int id = p.getId();
            String name = p.getName();
            String address = p.getAddress();
            String city = p.getCity();
            String state = p.getState();
            String status = p.getStatus();
            String property_info = p.getProperty_info();
            String price_per_unit = p.getPrice_per_unit();
            String notes = p.getNotes();
            String input_date = p.getInput_date();
            String units = p.getUnits();
            String data_year = p.getData_year();
            String avg_rent_per_unit = p.getAvg_rent_per_unit();
            String total_revenue = p.getTotal_revenue();
            String apartment_rent_revenue = p.getApartment_rent_revenue();
            String percent_of_apartment_rev = p.getPercent_of_apartment_rev();
            String operating_exp = p.getOperating_exp();
            String re_tax = p.getRe_tax();
            String noi = p.getNoi();
            String occ = p.getOcc();
            String stable = p.getStable();
            String commercial = p.getCommercial();
            String margin = p.getMargin();
            String sales_price = p.getSales_price();
            String sales_date = p.getSales_date();
            %>
      <div class="card" id="prop<%=id%>">
        <div class="content">
          <img src="images/testimg.jpg">
          <br>
          <h3 style="direction: ltr"><%=name%></h3>
          <p style="direction: ltr"><%=address%></p>
          <a id="button<%=id%>" href="#modal<%=id%>">More Info</a>
        </div>
      </div>
      <%}}%>
    </div>
  </div>
  <%if(!products.isEmpty()){
    for(mhpModel p : products){
      int id = p.getId();
      String name = p.getName();
      String address = p.getAddress();
      String city = p.getCity();
      String state = p.getState();
      String status = p.getStatus();
      String property_info = p.getProperty_info();
      String price_per_unit = p.getPrice_per_unit();
      String notes = p.getNotes();
      String input_date = p.getInput_date();
      String units = p.getUnits();
      String data_year = p.getData_year();
      String avg_rent_per_unit = p.getAvg_rent_per_unit();
      String total_revenue = p.getTotal_revenue();
      String apartment_rent_revenue = p.getApartment_rent_revenue();
      String percent_of_apartment_rev = p.getPercent_of_apartment_rev();
      String operating_exp = p.getOperating_exp();
      String re_tax = p.getRe_tax();
      String noi = p.getNoi();
      String occ = p.getOcc();
      String stable = p.getStable();
      String commercial = p.getCommercial();
      String margin = p.getMargin();
      String sales_price = p.getSales_price();
      String sales_date = p.getSales_date();
  %>

  <style>
    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      padding-top: 100px; /* Location of the box */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: rgb(0,0,0); /* Fallback color */
      background-color: rgba(0,0,0,0.4); /* Black w/ opacity */

    }
    /* Modal Content */
    .modal-content {
      position: relative;
      background-color: #fefefe;
      margin: auto;
      padding: 0;
      border: 1px solid #888;
      width: 80%;
      /*box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);*/
      -webkit-animation-name: animatetop;
      -webkit-animation-duration: 0.4s;
      animation-name: animatetop;
      animation-duration: 0.4s;
      box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
      border-radius: 15px;
    }

    /* Add Animation */
    @-webkit-keyframes animatetop {
      from {top:-300px; opacity:0}
      to {top:0; opacity:1}
    }

    @keyframes animatetop {
      from {top:-300px; opacity:0}
      to {top:0; opacity:1}
    }

    /* The Close Button */
    .close<%=id%> {
      color: white;
      float: right;
      font-size: 28px;
      font-weight: bold;
    }

    .close<%=id%>:hover,
    .close<%=id%>:focus {
      color: #000;
      text-decoration: none;
      cursor: pointer;
    }

    .modal-header {
      padding: 50px 25px;
      background-color: #3e0e18;
      color: white;
      border-radius: 15px;
    }

    .modal-body {
      padding: 2px 25px;
      width: 80%;
    }

    .modal-footer {
      padding: 25px 25px;
      background-color: #3e0e18;
      color: white;
      border-radius: 15px;
    }
  </style>

  <div id="modal<%=id%>" class="modal" style="direction: ltr">
    <!-- Modal content -->
    <div class="modal-content">
      <div class="modal-header">
        <span class="close<%=id%>">&times;</span>
        <h2><%=name%></h2>
      </div>
      <div class="modal-body">
        <br>
        <p>Address: <%=address%></p>
        <br>
        <p>Status: <%=status%></p>
        <br>
        <p>Property Info: <%=property_info%></p>
        <br>
        <p>Price Per Unit: <%=price_per_unit%></p>
        <br>
        <p>Units: <%=units%></p>
        <br>
      </div>
      <div class="modal-footer">
        <h3> </h3>
      </div>
    </div>
  </div>
  <script>
    // Get the modal
    var modal<%=id%> = document.getElementById("modal<%=id%>");
    // Get the button that opens the modal
    var btn<%=id%> = document.getElementById("button<%=id%>");
    // Get the <span> element that closes the modal
    var span<%=id%> = document.getElementsByClassName("close<%=id%>")[0];
    // When the user clicks the button, open the modal
    btn<%=id%>.onclick = function() {
      modal<%=id%>.style.display = "block";
    }
    // When the user clicks on <span> (x), close the modal
    span<%=id%>.onclick = function() {
      modal<%=id%>.style.display = "none";
    }
    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
      if (event.target == modal<%=id%>) {
        modal<%=id%>.style.display = "none";
      }
    }
  </script>
  <%}}%>
  <div class="column2" style="direction: ltr;">
    <div class="map" id="map">
    </div>
    <br>
    <style> body {
      background-image: url('gradient1.jpg');
      background-repeat: repeat-x;
    }

    .ex {
      margin: auto;
      width: 90%;
      padding: 10px;
      border: outset;
    }

    select {
      display: inline;
      cursor: pointer;
    }

    .ey {
      display: inline-block;
    }

    form {
      display: inline-block;
    }

    .gap {
      clear: both;
      margin-bottom: 2px;
    }
    </style>
    <div class="containersearch">
      <div class="ex" style="background-color: white">
        <div id='dd1.mob1' name='dd1.mob1' method='post' action=''>
          <p><label>Select Filter</label></p><br />
          <select class="dropdownsearch">
            <option>None</option>
            <option>Property Type</option>
          </select>

          <select class="dropdownsearch">
            <option>All</option>
            <option>MHP</option>
          </select>
          <button type="submit" class="dropdownsubmit">Submit</button>
        </div>
      </div>
    </div>
    <br>
    <script>
      var map = L.map('map', {doubleClickZoom: false, zoomControl: false}).locate({setView: true, zoom: 12, maxZoom: 16});
              // map = L.map('map', {zoomControl: false}).setView([40.7128, -74.0060], 4);

      L.control.zoom({
        position: 'topright'
      }).addTo(map);

      var tiles = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}',{
        maxZoom: 20,
        subdomains:['mt0','mt1','mt2','mt3']
      }).addTo(map);

      <%
          if(!products.isEmpty()){
              for(mhpModel p : products){
                  int id = p.getId();
                  String name = p.getName();
                  String address = p.getAddress();
                  String city = p.getCity();
                  String state = p.getState();
                  double lat = p.getLat();
                  double lon = p.getLon();
                  if(lat != 0 && lon != 0){
      %>
      var pop = L.popup({
        closeOnClick: true
      }).setContent('<div class="container"><h3 style="text-align : center;">' + '<%=name%>' +
              '</h3> <h4 style="text-align: center;"><%=address%>' + '</h4>' +
              '<br><a style="text-align: center; position: relative;display: inline-block;' +
              'padding: 8px 20px;margin-top: 15px;background: #000;color: #fff;border-radius: 20px;' +
              'text-decoration: none;font-weight: 500;box-shadow: 0 5px 15px rgba(0,0,0,0.2);' +
              '" href="#prop<%=id%>">Scroll</a></div>');

      //Pinpoints
      var marker = L.marker([<%=lat%>, <%=lon%>]).addTo(map).bindPopup(pop);

      //Zoom over hover
      document.querySelector('#prop<%=id%>').addEventListener("mouseover", ()=>{
        map.flyTo([<%=lat%>, <%=lon%>],14)
      })

      <%}}}%>
    </script>
</div>
</div>

<script type="text/javascript" src="js/vanilla-tilt.js"></script>
<script>
  VanillaTilt.init(document.querySelectorAll(".card"),
          {max: 25,
           speed: 400,
          glare: true,
          "max-glare": 1,});
</script>
</body>
</html>
