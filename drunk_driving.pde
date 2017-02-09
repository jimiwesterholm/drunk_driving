Drink drink = new Drink();


//initialise variables
boolean genderTest = false;
float limitTest = 0.05;

String introduction = "Do you know your limits?\n\nBy using the sliders and buttons below you can find out how the new drink driving law will affect you. The glasses to the left will fill up to symbolise the number of drinks that can be had before going over the legal limit. Squares represent full drinks. Please note that these values are estimates, and should be treated as such. There are many more variables that can affect a person's blood alchohol content.";

int glass = 0;

int imageX = 200;
int beerY = 100;
int wineY = 420;
int shotY = 740;
int beerWidth = 159;
int beerHeight = 300;
int wineWidth = 130;
int wineHeight = 300;
int shotWidth = 129;
int shotHeight = 200;

int lineX1 = 1050;
int lineX2 = 1350;
int rectX = 15;
int rectY = 15;
int y1 = 750;
int y2 = 900;


int button1 = lineX1 + (lineX2 - lineX1) / 2;  //top button x
int button2 = lineX1;  //bottom button x
int [] boxes = new int [7];  //Stores  the box x-coordinate

//Arrays for sliders
int [] weights = {40, 50, 60, 70, 80, 90, 100};
int [] waitHours = {0, 2, 4, 6, 8, 10, 12};

//Variables for sliders
int weight = 70;
int waitTime = 0;

void setup() {
  size(1500,1000);
}

void draw() {
  background(255);
  
  //Background image
  PImage glasses;
  glasses = loadImage("fff.png");
  image(glasses, 400, 0, 1100, 1000);
  
  noStroke();
  rectMode(CORNER);
  fill(255, 255, 255, 150);
  rect(1000, 100, 400, 850);
  
  textSize(32);
  textAlign(CENTER);
  fill(0);
  text("Drunk Driving", width/2, 60);
  
  textSize(16);
  text(introduction, 1050, 150, 300, 750);
  
  //Boxes for setting gender
  rectMode(CORNER);
  stroke(0);
  strokeWeight(2);
  fill(#3D63FF);
  rect(1050, 600, 40, 40);
  fill(#FF1414);
  rect(1090, 600, 40, 40);
  textSize(16);
  text("Male/Female", 1095, 580);
  
  //Boxes for setting DUI limit
  fill(#3D63FF);
  rect(1270, 600, 40, 40);
  fill(#FF1414);
  rect(1310, 600, 40, 40);
  text("DUI limit\n new/old", 1305, 560);
  
  //Text to explain sliders
  text("Weight", 1200, 700);
  text("Time before driving", 1200, 850);
  
  //Text to explain drinks
  fill(255, 255, 255, 150);
  noStroke();
  rectMode(CENTER);
  rect(540, 225, 240, 37);
  rect(540, 538, 240, 65);
  rect(540, 838, 240, 65);
  fill(0);
  textSize(20);
  text("A pint of beer (4% ABV)", 540, 230);
  text("A large (250ml)\nglass of wine (12% ABV)", 540, 530);
  text("A large (35ml)\nshot of spirit (40% ABV)", 540, 830);
  
  //Load images
  PImage imgBeer;
  imgBeer = loadImage("beer1.png");
  PImage imgShot;
  imgShot = loadImage("shot_glass1.png");
  PImage imgWine;
  imgWine = loadImage("wine_glass1.png");
  
  //Get standard units
  float units = drink.getStandardDrink(genderTest);
  
  //units to pints of beer (4% ABV)
  int beerFull = round((units / 2.3) - 0.5);
  float beer1 = (units % 2.3) / 2.3 * 100;
  float beer2 = map(beer1, 0, 100, 0, beerHeight);
  
  //Beer glass fill
  fill(#CDC4BF);
  noStroke();
  rectMode(CORNER);
  rect(imageX, beerY, beerWidth, beerHeight);
  
  //Beer glass lines
  if (genderTest == true)
  {
    stroke(#3D63FF);
  }
  else
  {
    stroke(#FF1414);
  }
  strokeWeight(3);
  line(imageX + 4, beerY + beerHeight - beer2, imageX + beerWidth - 4, beerY + beerHeight - beer2);
  
  
  image(imgBeer, imageX, beerY, beerWidth, beerHeight);
  
  //Shows full drinks
  strokeWeight(2);
  stroke(0);
  if (genderTest == true)
  {
    fill(#3D63FF);
  }
  else
  {
    fill(#FF1414);
  }
  for(int i = 0; i < beerFull; i++)
  {
    if (i < 3)
    {
      rect(100 + i * 30, beerY , 20, 20);
    }
    else if (i < 6)
    {
      rect(100 + (i - 3) * 30, beerY+ 30, 20, 20);
    }
    else
    {
      rect(100 + (i - 6) * 30, beerY + 60, 20, 20);
    }
  }
  
  //Units to 250ml wine glasses (12% ABV)
  stroke(#FFEC1E);
  int wineFull = round((units / 3) - 0.5);
  float wine1 = (units % 3) / 3 * 100;
  float wine2 = map(wine1, 0, 100, 0, wineHeight - 166);
  
  //Wine glass fill
  fill(#CDC4BF);
  noStroke();
  rectMode(CORNER);
  rect(imageX, wineY, wineWidth, wineHeight);
  
  //Wine glass lines
  if (genderTest == true)
  {
    stroke(#3D63FF);
  }
  else
  {
    stroke(#FF1414);
  }
  strokeWeight(3);
  line(imageX + 4, wineY + wineHeight - 166 - wine2, imageX + wineWidth - 4, wineY + wineHeight - 166 - wine2);
  
  
  image(imgWine, imageX, wineY, wineWidth, wineHeight);

  strokeWeight(2);
  stroke(0);
  if (genderTest == true)
  {
    fill(#3D63FF);
  }
  else
  {
    fill(#FF1414);
  }
  for(int i = 0; i < wineFull; i++)
  {
    if (i < 3)
    {
      rect(100 + i * 30, wineY, 20, 20);
    }
    else
    {
      rect(100 + (i - 3) * 30, wineY + 30, 20, 20);
    }
  }
  
  //Units to 35ml shots of spirits (40% ABV)
  stroke(#FF0000);
  int shotFull = round((units / 1.4) - 0.5);
  float shot1 = (units % 1.4) / 1.4 * 100;
  float shot2 = map(shot1, 0, 100, 0, shotHeight);
  
  //Shot glass fill
  fill(#CDC4BF);
  noStroke();
  rectMode(CORNER);
  rect(imageX, shotY, shotWidth, shotHeight);
  
  //Shot glass lines
  if (genderTest == true)
  {
    stroke(#3D63FF);
  }
  else
  {
    stroke(#FF1414);
  }
  strokeWeight(3);
  line(imageX + 4, shotY + shotHeight - shot2, imageX + shotWidth - 4, shotY + shotHeight - shot2);
  
  
  image(imgShot, imageX, shotY, shotWidth, shotHeight);
  
  strokeWeight(2);
  stroke(0);
  if (genderTest == true)
  {
    fill(#3D63FF);
  }
  else
  {
    fill(#FF1414);
  }
  for(int i = 0; i < shotFull; i++)
  {
    if (i < 3)
    {
      rect(100 + i * 30, shotY , 20, 20);
    }
    else if (i < 6)
    {
      rect(100 + (i - 3) * 30, shotY + 30, 20, 20);
    }
    else if (i < 9)
    {
      rect(100 + (i - 6) * 30, shotY + 60, 20, 20);
    }
    else if (i < 12)
    {
      rect(100 + (i - 9) * 30, shotY + 90, 20, 20);
    }
    else
    {
      rect(100 + (i - 12) * 30, shotY + 120, 20, 20);
    }
  }
  
  strokeWeight(2);
  stroke(0);
  line(lineX1,y1,lineX2,y1);
  line(lineX1,y2,lineX2,y2);
  
  rectMode(CENTER);
  textSize(16);
  fill(#3FB8FF);
  for (int i = 0; i < 7; i++)
  {
    rect(lineX1 + i * (lineX2 - lineX1) / 6, y1, rectX, rectY, 3);
    rect(lineX1 + i * (lineX2 - lineX1) / 6, y2, rectX, rectY, 3);
    boxes [i] = lineX1 + i * (lineX2 - lineX1) / 6;
    text(weights[i] + "kg", lineX1 + i * (lineX2 - lineX1) / 6, y1 - 20);
    text(waitHours[i] + "h", lineX1 + i * (lineX2 - lineX1) / 6, y2 - 20);
  }
  
  button(button1, y1);
  button(button2, y2);
  
  
  
}

void button(int x, int y) {
  pushMatrix();
  translate(x, y);
  fill(#FF3223);
  rectMode(CENTER);
  rect(0, 0, 20, 30, 5);
  popMatrix();
}

void mouseClicked() {
  //declare variables
  int boxX;
  int counter;  //keeps count of array used 
  
  //Sets gender
  if (mouseX >= 1050 && mouseX <= 1090 && mouseY >= 600 && mouseY <= 640)
  {
    genderTest = true;
    return;
  }
  else if (mouseX > 1090 && mouseX <= 1130 && mouseY >= 600 && mouseY <= 640)
  {
    genderTest = false;
    return;
  }
  //Sets the limit
  else if (mouseX > 1270 && mouseX <= 1310 && mouseY >= 600 && mouseY <= 640)
  {
    limitTest = 0.05;
    drink.changeVar(weight, waitTime, limitTest);
    return;
  }
  else if (mouseX > 1310 && mouseX <= 1350 && mouseY >= 600 && mouseY <= 640)
  {
    limitTest = 0.08;
    drink.changeVar(weight, waitTime, limitTest);
    return;
  }
  //Sets x coordinate
  else if (boxes[0] - rectX / 2 <= mouseX && mouseX <= boxes[0] + rectX / 2)
  {
    boxX = boxes[0];
    counter = 0;
  }
  else if (boxes[1] - rectX / 2 <= mouseX && mouseX <= boxes[1] + rectX / 2)
  {
    boxX = boxes[1];
    counter = 1;
  }
  else if (boxes[2] - rectX / 2 <= mouseX && mouseX <= boxes[2] + rectX / 2)
  {
    boxX = boxes[2];
    counter = 2;
  }
  else if (boxes[3] - rectX / 2 <= mouseX && mouseX <= boxes[3] + rectX / 2)
  {
    boxX = boxes[3];
    counter = 3;
  }
  else if (boxes[4] - rectX / 2 <= mouseX && mouseX <= boxes[4] + rectX / 2)
  {
    boxX = boxes[4];
    counter = 4;
  }
  else if (boxes[5] - rectX / 2 <= mouseX && mouseX <= boxes[5] + rectX / 2)
  {
    boxX = boxes[5];
    counter = 5;
  }
  else if (boxes[6] - rectX / 2 <= mouseX && mouseX <= boxes[6] + rectX / 2)
  {
    boxX = boxes[6];
    counter = 6;
  }
  else
  {
    return;
  }
  
  //Sets y-coordinate
  if (y1 - rectY / 2 <= mouseY && mouseY <= y1 + rectY / 2)
  {
    button1 = boxX;
    weight = weights[counter];
    drink.changeVar(weight, waitTime, limitTest);
  }
  else if (y2 - rectY / 2 <= mouseY && mouseY <= y2 + rectY / 2)
  {
    button2 = boxX;
    waitTime = waitHours[counter];
    drink.changeVar(weight, waitTime, limitTest);
  }
  else
  {
    return;
  }
  
}
