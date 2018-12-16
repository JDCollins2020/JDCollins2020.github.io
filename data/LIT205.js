var result;
function preload() {
  result = loadStrings('dante.txt');
}
function word(x,y,fill,size,value){
  this.x = x;
  this.fill = fill;
  this.size = size;
  this.value = value;
}
function setup() {
  createCanvas(640, 480);
  var ind = floor(random(result.length));
  textSize(12);
  text(result[ind], 100, 100, 80, 80);
}

function draw() {
}
