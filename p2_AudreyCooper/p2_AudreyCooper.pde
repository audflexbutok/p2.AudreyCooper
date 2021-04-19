import controlP5.*;

PImage bg, sneedle, tneedle, leftarrow, rightarrow;
PImage abs, airbag, battery, brights, checkengine, cruisecontrol, esp, foglights;
PImage hazard, hoodopen, oil, oillevel, parkingbrake, seatbelt, service, tirepressure;
PImage tractioncontrol, trunkopen;
int sangle, tangle;
boolean showLeftArrow, showRightArrow, showIndicators, showHazards, showP, showR, showN, showD, showCruiseControl, showBrights, showFoglights;
ControlP5 cp5;

void setup() {
  cp5 = new ControlP5(this);
  // set up screen size and and background
  size(1000, 666);
  bg = loadImage("dash.jpg");
  
  // needles
  sneedle = loadImage("ndl.png");
  sneedle.resize(90, 90);
  tneedle = loadImage("ndl2.png");
  tneedle.resize(80, 80);
  sangle = 0;
  tangle = 0;
  
  // turn signals
  rightarrow = loadImage("rightarrow.png");
  rightarrow.resize(66, 66);
  leftarrow = loadImage("leftarrow.png");
  leftarrow.resize(66, 66);
  
  // warning indicators 
  abs = loadImage("ABS.jpg");
  airbag = loadImage("airbag.jpg");
  battery = loadImage("battery.jpg");
  checkengine = loadImage("checkengine.jpg");
  esp = loadImage("ESP.jpg");
  hoodopen = loadImage("hoodopen.jpg");
  oil = loadImage("oil.jpg");
  oillevel = loadImage("oillevel.jpg");
  parkingbrake = loadImage("parkingbrake.jpg");
  seatbelt = loadImage("seatbelt.jpg");
  service = loadImage("service.jpg");
  tirepressure = loadImage("tirepressure.jpg");
  tractioncontrol = loadImage("tractioncontrol.jpg");
  trunkopen = loadImage("trunkopen.jpg");
  
  // use indicators
  brights = loadImage("brights.jpg");
  foglights = loadImage("foglights.jpg");
  hazard = loadImage("hazard.jpg");
  cruisecontrol = loadImage("cruisecontrol.jpg"); 
  
  // buttons
  cp5.addButton("P").setValue(0).setPosition(440, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){P();}});
  cp5.addButton("R").setValue(0).setPosition(470, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){R();}});
  cp5.addButton("N").setValue(0).setPosition(500, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){N();}});
  cp5.addButton("D").setValue(0).setPosition(530, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){D();}});
  cp5.addButton("CRUISE").setValue(0).setPosition(580, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){cruise();}});
  cp5.addButton("HEADLIGHTS").setValue(0).setPosition(390, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){headlights();}});
  cp5.addButton("FOGLIGHTS").setValue(0).setPosition(340, 615).setSize(45, 45).addListener(new ControlListener() {public void controlEvent(ControlEvent theEvent){foglights();}});
}

void draw(){
  // load in background
  background(bg);
  
  // -------------------------------------------------------------------------
  // Speedometer needle image & rotation
  // sneedle: 495, 290
  imageMode(CENTER);
  pushMatrix();
  translate(495, 370);
  rotate(radians(sangle));
  image(sneedle, 0, 0);
  popMatrix();
  
  // Tachometer needle image & rotation
  // tneedle: 120, 320
  pushMatrix();
  translate(130, 400);
  rotate(radians(tangle));
  image(tneedle, 0, 0);
  popMatrix();
  
  // -------------------------------------------------------------------------
  // if rightarrow boolean triggered, show image
  if(showRightArrow == true) {
    image(rightarrow, 685, 160);
  }
  
  // if leftarrow boolean triggered, show image
  if(showLeftArrow == true) {
    image(leftarrow, 310, 160);
  }
  
  // if both leftarrow and rightarrow booleans triggered, show both
  if(showLeftArrow == true && showRightArrow == true) {
    image(rightarrow, 685, 160);
    image(leftarrow, 310, 160);
    image(hazard, 490, 160);
  }
  
  // -------------------------------------------------------------------------
  // LEFT EDGE: 810, RIGHT EDGE: 950
    // mechanical warning indicators: battery, checkengine, oil, oillevel, service, tirepressure
  if (showIndicators == true){
    image(battery, 835, 450);
    image(checkengine, 880, 460);
    image(oil, 925, 450);
    image(oillevel, 950, 410);
    image(service, 900, 410);
    image(tirepressure, 810, 410);
    // other warning indicators: abs, airbag, esp, hoodopen, parkingbrake, seatbelt, tractioncontrol, trunkopen
    image(abs, 810, 370);
    image(airbag, 855, 370);
    image(esp, 830, 330);
    image(hoodopen, 950, 370);
    image(parkingbrake, 880, 320);
    image(trunkopen, 925, 330);
    image(seatbelt, 900, 370);
    image(tractioncontrol, 855, 410);
  }
  
  // -------------------------------------------------------------------------
  // gears
  if(showP == true) {
    textSize(32);
    text("P", 485, 490);
    fill(255);
  }
  
  if(showR == true) {
    textSize(32);
    text("R", 485, 490);
    fill(255);
  }
  
  if(showN == true) {
    textSize(32);
    text("N", 485, 490);
    fill(255);
  }
  
  if(showD == true) {
    textSize(32);
    text("D", 485, 490);
    fill(255);
  }
  
  // display temperature
  textSize(40);
  text("73°F", 85, 250);
  cruisecontrol.resize(35, 35);
  
  if (showCruiseControl == true) {
    image(cruisecontrol, 800, 250);
  }
 
 if (showBrights == true){
  image(brights, 875, 252);
 }
 
 if (showFoglights == true){
  image(foglights, 950, 254);
 }
}

// control keys
void keyPressed(){
  // -------------------------------------------------------------------------
  // SPEEDOMETER & TACHOMETER
  // if space bar is pressed, increase angle of speedometer & tachometer
  if(keyCode == 32) {
    sangle += 8;
    tangle += 3;
  } else if(keyCode == 66) {
    sangle -= 8;
    tangle -= 3;
  } else if(showCruiseControl == true) {
    sangle += 0;
    tangle += 0;
  }
  
  // -------------------------------------------------------------------------
  // TURN SIGNALS
  // if left arrow pressed, show left turn signal
  if(keyCode == 37) {
    showLeftArrow = true; 
  } else if(showLeftArrow == true) {
    showLeftArrow = false;
  }
  
  // if right arrow is pressed, show right turn signal
  if(keyCode == 39) {
    showRightArrow = true;
  } else if(showRightArrow == true){
    showRightArrow = false;
}
  // -------------------------------------------------------------------------
  // HAZARDS
  // if up arrow is pressed, show both turn signals (for hazards)
  if(keyCode == 38) {
    showRightArrow = true;
    showLeftArrow = true;
    showHazards = true;
  } else if(showRightArrow == true && showLeftArrow == true) {
    showRightArrow = false;
    showLeftArrow = false;
    showHazards = false;
  }
  
   if (key == 'i'){
    showIndicators = true;
  } else {
    showIndicators = false;
  }
  
}

  // BUTTONS
  // -------------------------------------------------------------------------
  // PRND
  
  public void P() {
    showP = true;
    showR = false;
    showN = false;
    showD = false;
  }
  
  public void R() {
    showP = false;
    showR = true;
    showN = false;
    showD = false;
  }
  
   public void N(){
    showP = false;
    showR = false;
    showN = true;
    showD = false;
  }
  
  public void D() {
    showP = false;
    showR = false;
    showN = false;
    showD = true;
  }
  
  // TODO: ADD TOGGLE FUNCTIONALITY
  
   public void cruise() {
    showCruiseControl = true;
  }
  
  public void headlights() {
    showBrights = true;
  }
  
  public void foglights() {
    showFoglights = true;
  }
  
  
