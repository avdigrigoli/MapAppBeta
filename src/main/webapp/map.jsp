<%@ page import="com.victrix.victrix.daos.mhpDao" %>
<%@ page import="com.victrix.victrix.models.mhpModel" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: antho
  Date: 8/28/2022
  Time: 11:04 PM
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Map</title>

    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.8.0/dist/leaflet.css"
          integrity="sha512-hoalWLoI8r4UszCkZ5kL8vayOGVae1oxXe/2A4AO6J9+580uKHDO3JdHb7NzwwzK5xr/Fs0W40kiNHxM9vyTtQ=="
          crossorigin=""/>

    <script src="https://unpkg.com/leaflet@1.8.0/dist/leaflet.js"
            integrity="sha512-BB3hKbKWOc9Ez/TAwyWxNXeoV9c1v6FIeYiBieIWkpLjauysF18NzgR1MBNBXf8/KABdlkX68nAhlwcDFLGPCQ=="
            crossorigin=""></script>
</head>
<style>
    body{
        margin: 0;
        padding: 0;
    }
    h1{
        margin: 50px;
        text-align: center;
    }

    .container{
        display: grid;
        grid-template-columns: 1fr 1fr;
        grid-gap: 10px;
        padding: 20px;
    }


    .map{
        width: 100%;
        height: 500px;
    }

    .props{
        display: grid;
        grid-template-columns: 1fr 1fr 1fr;
        grid-gap: 10px;
        padding: 10px;
        background-color: azure;
    }

    .props div img{
        width: 100%;
    }

    .props div img:hover{
        opacity: 0.75;
    }


    /* The Modal (background) */
    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        -webkit-animation-name: fadeIn; /* Fade in the background */
        -webkit-animation-duration: 0.4s;
        animation-name: fadeIn;
        animation-duration: 0.4s
    }
    /** MODAL STYLE **/
    /* Modal Content */
    .modal-content {
        position: fixed;
        bottom: 0;
        background-color: #fefefe;
        width: 100%;
        -webkit-animation-name: slideIn;
        -webkit-animation-duration: 0.4s;
        animation-name: slideIn;
        animation-duration: 0.4s
    }

    /* The Close Button */
    .close {
        color: white;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .modal-header {
        padding: 2px 16px;
        background-color: #5cb85c;
        color: white;
    }

    .modal-body {padding: 2px 16px;}

    .modal-footer {
        padding: 2px 16px;
        background-color: #5cb85c;
        color: white;
    }

    /* Add Animation */
    @-webkit-keyframes slideIn {
        from {bottom: -300px; opacity: 0}
        to {bottom: 0; opacity: 1}
    }

    @keyframes slideIn {
        from {bottom: -300px; opacity: 0}
        to {bottom: 0; opacity: 1}
    }

    @-webkit-keyframes fadeIn {
        from {opacity: 0}
        to {opacity: 1}
    }

    @keyframes fadeIn {
        from {opacity: 0}
        to {opacity: 1}
    }

</style>
<!-- UNUSED STYLES
p{
        text-align: right;
        margin-right: 10px;
        font-size: 20;
    }
-->

<body>
    <h1>Properties</h1>

<div class="container">
    <div class="props" style="overflow: scroll; height: 500px">
        <% mhpDao pd = new mhpDao();
            List<mhpModel> products = pd.getAllProps();
            if(!products.isEmpty()){
                //Collections.reverse(products);
                int counter = 0;
                for(mhpModel p : products){
                    int id = p.getId();
                    String name = p.getName();
                    String address = p.getAddress();
                    String city = p.getCity();
                    String state = p.getState();
                   // System.out.println(counter + ": " + address);
                    counter++;
        %>
        <style>
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
        </style>
        <div id="prop<%=id%>">
           <div id="content<%=id%>">
            <img src="images/testimg.jpg">
            <h2><%=name%></h2>
            <p><%=address%></p>
           </div>


            <!-- Trigger/Open The Modal -->
            <button id="button<%=id%>">More Info</button>

            <!-- The Modal -->
            <div id="modal<%=id%>" class="modal" style="z-index: 100">

                <!-- Modal content -->
                <div class="modal-content">
                    <div class="modal-header">
                        <span class="close<%=id%>">&times;</span>
                        <h2><%=name%></h2>
                    </div>
                    <div class="modal-body">
                        <p><%=address%></p>
                        <p><%=city%>, <%=state%></p>
                    </div>
                    <div class="modal-footer">
                        <!--<h3>Modal Footer</h3>-->
                    </div>
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
    </div>
    <div class="map" id="map" style="z-index: 1">
    </div>
    <!--<script src="js/app.js" defer></script>-->
    <script>
        var map = L.map('map').setView([40.7128, -74.0060], 4);

        var tiles = L.tileLayer('http://{s}.google.com/vt/lyrs=s,h&x={x}&y={y}&z={z}',{
            maxZoom: 20,
            subdomains:['mt0','mt1','mt2','mt3']
        }).addTo(map);

            /*L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
        }).addTo(map);*.


        /** THIS IS WHERE YOU PUT EACH LIST OF ATTRIBUTES CORRESPONDING TO EACH PROPERTY **/
        coords = [[40,-74]]
        console.log(coords);
        description = ['Office Building']
        state = ['NY']
        images = ["images/testimg.jpg"]

        let l = coords.length;

       // var prop1 = document.querySelector('#prop1');
        //MAKE A WAY TO AUTO GRAB ALL THE AMOUNT OF PROPS THAT EXIST
      //  properties = [prop1]


        //for (let i = 0; i<l; i++){
            //popups
        <%
            if(!products.isEmpty()){
                //Collections.reverse(products);
                int counter = 0;
                for(mhpModel p : products){
                    int id = p.getId();
                    String name = p.getName();
                    String address = p.getAddress();
                    String city = p.getCity();
                    String state = p.getState();
                    double lat = p.getLat();
                    double lon = p.getLon();
                    //System.out.println(counter + ": " + address);
                    counter++;
                    if(lat != 0 && lon != 0){
        %>
            var pop = L.popup({
                closeOnClick: true
            }).setContent('<h4> Name: ' + '<%=name%>' + '<br>State: ' +
                '<%=state%>' + '</h4><img src=' + images[0] + ' style="height:100px" alt="NO PHOTO SAVED">');

            //Pinpoints
            var marker = L.marker([<%=lat%>, <%=lon%>]).addTo(map).bindPopup(pop);

            //Side of pinpoint labels
          /*  var toollip = L.tooltip({
                permanent: true
            }).setContent('<%=name%>');
            marker.bindTooltip(toollip)
          */

            //Zoom over hover
            document.querySelector('#prop<%=id%>').addEventListener("mouseover", ()=>{
                map.flyTo([<%=lat%>, <%=lon%>],14)
            })

       // }<%}}}%>
    </script>
</div>
</body>
</html>
