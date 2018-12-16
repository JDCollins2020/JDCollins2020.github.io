var result;
function preload() {
  result = loadStrings('dante.txt');
}

function setup() {
  createCanvas(640, 480);
    background(200);
  var ind = floor(random(result.length));
  text(result[ind], 10, 10, 80, 80);
}

function draw() {
  if (mouseIsPressed) {
    fill(0);
  } else {
    fill(255);
  }
  ellipse(mouseX, mouseY, 80, 80);
}
