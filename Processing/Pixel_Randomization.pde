// This code takes in an image, and randomizes its pixels

PImage img, img_edit;
boolean show_instructions = true;
int show_picture = 1;
//------------------------------------------------------------------------
void keyPressed(){
  img.loadPixels();
  img_edit.loadPixels();
  
  if (key=='i'){
    show_instructions = true;
  }
  else if (key=='1'){ //show original picture
    show_instructions = false;
    show_picture = 1;

  }
  else if (key=='2'){ //show randomized pixels
    show_instructions = false;
    show_picture = 2;
  }
} // end of keyPressed
//-----------------------------------------------------------------------
void setup(){
  size(500,500);
  img = loadImage("foo.jpg");
  img_edit = createImage(img.width, img.height, RGB);
  // randomize a list of numbers that represent pixels numbers
  IntList list = new IntList();
  for (int i=0; i<img.pixels.length; i++){
    list.append(i);
  }
  list.shuffle(); //list is now a list of numbers in a random order
  
  for (int i=0; i<img.pixels.length;i++){
    int num = list.get(i);
    color c = img.pixels[num];
    img_edit.pixels[i] = c;
  } // end of for loop
  img_edit.updatePixels();
}

void draw(){
  if (show_instructions){
    String str1 = "  Instructions: Press the follow keys for...";
    String str2 = "    1 for original image";
    String str3 = "    2 pixel randomization of image";
    String str4 = "    i to see these instructions again";
    PFont font = createFont("Times New Roman", 20, true);
    background(0);
    textFont(font);
    textAlign(LEFT);
    fill(255);
    text(str1, 0,75);
    text(str2, 0,125);
    text(str3, 0,175);
    text(str4, 0,225);
  }
  else if (show_picture==1){
    image(img, 0,0, 500,500);
  }
  else if (show_picture==2){
    image(img_edit, 0,0, 500,500);
  }
} // end of draw
