<%@ page import="com.victrix.victrix.daos.mhpDao" %>
<%@ page import="com.victrix.victrix.models.mhpModel" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: antho
  Date: 8/26/2022
  Time: 7:28 AM
--%>
<html>
  <head>
    <title>Coordinate Grabber</title>

  </head>
  <body>
  <div style="display: none" id="results"></div>
      <script type="text/javascript">
          var coords = []
          console.log(coords);

       window.addEventListener('load', function (){
         findAddress()
          })

      //var address = document.querySelector("#address")
      //var results = document.querySelector("#results")

      /*function showAddress() {
          results.innerHTML  = ' '
          if (addressArr.length > 0) {
                  var latitude = parseFloat(addressArr[0].lat).toFixed(5)
                  var longitude = parseFloat(addressArr[0].lon).toFixed(5)
                  coords.push([/*addressArr[0].display_name, parseFloat(latitude), parseFloat(longitude)])
          }
      }*/
      <!-- THIS IS THE MAIN SCRIPT YOU NEED TO MAKE THE CORRECT ARRAYS TO STORE THE COORDINATE POINTS -->
      function findAddress() {
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
              System.out.println(counter + ": " + address);
              counter++;
              %>

          var url = "https://nominatim.openstreetmap.org/search?format=json&limit=3&q=" + "<%=address%>"
          fetch(url)
              .then(response => response.json())
              .then(data => addressArr = data)
              //.then(show => console.log(addressArr))
                  .then(save => coords.push([parseFloat(addressArr[0].lat), parseFloat(addressArr[0].lon)]))
              .catch(err => console.log(err))



        <% /**GET EVERYTHING SAVED FOR THE MAP EXCEPT FOR THE COORDINATES IN HERE INTO THE OTHER ARRAYS FROM THE VARIABLE FROM
         NORMAL JAVA SAVED TO AN ARRAY IN JAVASCRIPT (MIGHT HAVE TO DO A SECOND LOOP TO CHECK IF THE ADDRESS STRING IS NULL AND DO BY THAT)**/
    }}
%>
      }
  </script>
  <%@include file="map.jsp"%>
  </body>
</html>
