var map = L.map('map').setView([40.7128, -74.0060], 12);

var tiles = L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);


/** THIS IS WHERE YOU PUT EACH LIST OF ATTRIBUTES CORRESPONDING TO EACH PROPERTY **/
coords = [[40.75277, -73.97491]]
description = ['Office Building']
state = ['NY']
images = ["images/testimg.jpg"]

let l = coords.length;

var prop1 = document.querySelector('#prop1');
//MAKE A WAY TO AUTO GRAB ALL THE AMOUNT OF PROPS THAT EXIST
properties = [prop1]

for (let i = 0; i<l; i++){
    //popups

    var pop = L.popup({
        closeOnClick: true
    }).setContent('<h4>Desciption:' + description[i] + '<br>State: ' +
        state[i] + '</h4><img src=' + images[i] + ' style="height:100px" alt="NO PHOTO SAVED">');

    //Pinpoints
    var marker = L.marker(coords[i]).addTo(map).bindPopup(pop);

    //Side of pinpoint labels
    var toollip = L.tooltip({
        permanent: true
    }).setContent(description[i]);
    marker.bindTooltip(toollip)

    //Zoom over hover
    properties[i].addEventListener("mouseover", ()=>{
        map.flyTo(coords[i],16)
    })

}

