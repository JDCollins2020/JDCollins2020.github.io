var word = ["circle", "second", "against", "themselves", "bolgia", "myself", "within", "little", "things", "valley", "beheld", "already", "others", "onward", "itself", "before", "return", "turned", "seemed", "silent", "downward", "himself", "speech", "master", "another", "weeping", "whence", "through", "because", "people", "behind", "heaven", "father", "became", "replied", "spirit", "farther", "should", "desire", "leader", "behold", "without", "towards", "together", "saying", "wholly", "upward", "answer", "thyself", "bottom"];

function setup() {
  createCanvas(640, 480);
  var ind = floor(random(word.length));
  textSize(12);
  text(word[ind], 100, 100, 80, 80);
}

function draw() {
}
