//Creates an animated word cloud
//Jack Collins


//Variable Bank/Array Set Up
//150 to prevent an entire docuement from being run. only need 50 words
String[] passage = new String[150];
//words from the passage
String[] peices ;
//sorted words from the passage
String[] sortedList;
//x value for word movement
int[] movingx = new int[50];
//y value for the word movement
int[] stabley = new int[50];
//increment value for the moving words
int[] incre = new int[50];
//font size of the moving words
int[] txtSize = new int[50];
//instance variable for the length of the maximum word
int maxNum = 1;
//color to be randomly generated for the words
float hue;
//Binary switch used to activate blur mode on the word cloud  
int bSwitch =1;
public void setup()
{
  size(1000, 900);
  //load X values
  for(int counter=0; counter < 50; counter++)
    {
      int x = int(random(0, width));
      movingx[counter]=x;
    }
  //load Y values
    for(int counter=0; counter < 50; counter++)
    {
      int y = int(random(0, height));
      stabley[counter]=y;
    }
   //load increment values
   for(int counter=0; counter < 50; counter++)
    {
      if(counter%2 == 1)
      {incre[counter] = -1;}
      else
      {incre[counter] = 1;}
    }
  //Establish color mode and generate a theme for the cloud
  colorMode(HSB, 360, 100, 100);
  hue = random(0,360);
  background(360);
  //Rip Lines from TXT document
  passage = loadStrings("dante.txt");
  for (int line=1; line < passage.length; line++)
  {
    //Add all lines to make one long line
    passage[0] = passage[0] + " " +passage [line];
  }
  //Extract Individual words from super line
  peices = split(passage[0], " ");
  //remove characters that are not letters
  for (int araPos=0; araPos < peices.length; araPos++)
  {
    for (int charc=0; charc < peices[araPos].length(); charc++)
    {
      if (peices[araPos].charAt(charc) >= 65 && peices[araPos].charAt(charc) <=90)
      {
      } else if (peices[araPos].charAt(charc) >= 97 && peices[araPos].charAt(charc) <=121)
      {
      } else
      {
        peices[araPos] = peices[araPos].substring(0, charc);
      }
    }
  }
  //establish length of sorted list
  sortedList = new String[peices.length];
  //retreive maximum length
  getMaxL();
  //remove words lesser or equal to 3 characters
  removeShort();
  //sorts the words by length
  sortList();
  
  //assign font size based on length
    for(int counter=0; counter < 50; counter++)
    {
      txtSize[counter] = int(map(sortedList[counter].length(),4,maxNum,25,85));
    }
  
}

public void draw()
{
  
  //checks switch condtion
  if( bSwitch ==1)
  {background(360);}
  frameRate(60);
  //increments the x pos of words so they move
   for(int counter=0; counter < 50; counter++)
   {
     fill(hue,100-(2*counter),52,255-(2*counter));
     textSize(txtSize[counter]);
     text(sortedList[counter],movingx[counter],stabley[counter]);
     movingx[counter]=movingx[counter] + incre[counter];;
     if(movingx[counter]>width-200)
       {incre[counter]=-1;}
     if (movingx[counter]<0)
       {incre[counter] =1;}
   }
}
/*
 *Binary switch the controls blur effect
 *
 */
void keyPressed()
{
  if(bSwitch == 1)
    {bSwitch = 0;}
  else
    {bSwitch=1;}
}


//------------------------------------------------------------------
/*
 *Checks all the entries in the array list peices
 *and determines the length of the longest word and saves it
 */
void getMaxL()
{
  for ( int numP = 0; numP < peices.length; numP++)
  {
    if (peices[numP].length() > maxNum)
    {
      maxNum = peices[numP].length();
    }
  }
}
/*-----------------------------------------------------------------
 *removes all words from list peices that
 *are shorter than three characters
 */
void removeShort ()
{
  //number of words removed for being to short
  int numRemoved = 0;
  //counter structure used to shift words list
  int shift;
  int length = peices.length;
  for (int numP = 0; numP < length; numP++)
  {
    if (peices[numP].length() <= 3)
    {
      numRemoved++;
      for (shift = numP; shift < length-1; shift++ )
      {
        peices[shift] = peices[shift+1];
      }
      numP--;
    }
  }
  while (numRemoved > 0)
  {
    peices = shorten(peices);
    numRemoved--;
  }
}
/*-------------------------------------------------------------------
 *sorts the list peices by length, and 
 * stores this sorted list in the new array list
 *sortedList
 */
void sortList()
{
  int slPos = 0;
  for (int x = maxNum; x>0; x--)
  {
    for (int i = 0; i < peices.length; i++)
    { 
      //println(i);
      if (peices[i].length()==x)
      {
        sortedList[slPos]=peices[i];
        slPos++;
        //println("entered, "+i );
      }
    }
  }
  while (sortedList.length>50)
  {
    sortedList = shorten(sortedList);
  }
}
