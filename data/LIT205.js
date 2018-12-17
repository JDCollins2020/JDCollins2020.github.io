var word = ["circle", "second", "against", "themselves", "bolgia", "myself", "within", "little", "things", "valley", "beheld", "already", "others", "onward", "itself", "before", "return", "turned", "seemed", "silent", "downward", "himself", "speech", "master", "another", "weeping", "whence", "through", "because", "people", "behind", "heaven", "father", "became", "replied", "spirit", "farther", "should", "desire", "leader", "behold", "without", "towards", "together", "saying", "wholly", "upward", "answer", "thyself", "bottom"];
var length = ["30", "17", "27", "18", "20", "26", "57", "57", "25", "21", "47", "37", "36", "17", "31", "50", "17", "67", "30", "16", "28", "42", "18", "70", "36", "16", "28", "58", "42", "59", "25", "18", "16", "19", "18", "19", "21", "28", "17", "26", "26", "44", "16", "35", "17", "23", "16", "16", "17", "19"];
var x;
var y;
var direction;
var hue;
function setup() {
  createCanvas(800, 800);
  //intialize x position
    for(int ndx = 0; ndx < word.length; ndx++)
    {
      x[ndx] = int(random(0, width));
      y[ndx] = int(random(0,height));
      length[ndx] = map(length[ndx],16,70,25,85);
      if(ndx%2 == 0){
        direction[ndx] = 1;
      }
      else{
        direction[ndx] = -1;
      }
    }
  colorMode(HSB, 360, 100, 100);
  hue = random(0,360);
  var ind = floor(random(word.length));
  textSize(12);
  text(word[ind], 100, 100, 80, 80);
}

function draw() {
  background(360);
  for(int counter=0; counter < words.length; counter++)
   {
     fill(hue,100-(2*counter),52,255-(2*counter));
     textSize(length[counter]);
     text(word[counter],x[counter],y[counter]);
     x[counter]=x[counter] + direction[counter];;
     if(x[counter]>width-200)
       {direction[counter]=-1;}
     if (x[counter]<0)
       {direction[counter] =1;}
   }
}
