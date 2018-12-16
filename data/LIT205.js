var result;
var wordCloud = {
  arr: new Array();
}
function preload() {
  wordCloud.arr = loadStrings('dante.txt');
}

function setup() {
  createCanvas(640, 480);
  var ind = floor(random(result.length));
  text(wordCloud.arr[ind], 100, 100, 80, 80);
}

function draw() {
}
