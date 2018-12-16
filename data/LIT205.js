var result;
var wordCloud = {
  arr: new Array();
}
function preload() {
  result = loadStrings('dante.txt');
}

function setup() {
  createCanvas(640, 480);
  var ind = floor(random(result.length));
  text(result[ind], 100, 100, 80, 80);
}

function draw() {
}
