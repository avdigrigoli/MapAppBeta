var fs = require('fs');
var data = fs.readFileSync('data.json');
var props = JSON.parse(data);
console.log(props);