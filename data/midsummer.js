var word = ["athens", "father", "hermia", "theseus", "lysander", "demetrius", "fairies", "thisbe", "moonshine", "hippolyta", "athenian", "another", "should", "helena", "follow", "things", "lovers", "therefore", "gentle", "tongue", "bottom", "quince", "through", "pyramus", "thisby", "nothing", "oberon", "titania", "cannot"]; 


var length = [24, 14, 52, 20, 43, 46, 11, 16, 11, 11, 16, 12, 34, 33, 19, 13, 15, 12, 16, 13, 18, 13, 22, 40, 23, 11, 15, 15, 12];


var x = new Array();



var y = new Array();



var direction = new Array();



var hue;



function setup() {



  createCanvas(1000, 500);



  //intialize x position

	var ndx;

    for(ndx = 0; ndx < word.length; ndx++){



      x[ndx] = int(random(1, width));



      y[ndx] = int(random(40,height-40));



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



}







function draw() {



  background(360);

	var counter;

  for(counter=0; counter < word.length; counter++)



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
