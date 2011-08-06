/* This program is free software. It comes without any warranty, to
 * the extent permitted by applicable law. You can redistribute it
 * and/or modify it under the terms of the Do What The Fuck You Want
 * To Public License, Version 2, as published by Sam Hocevar. See
 * http://sam.zoy.org/wtfpl/COPYING for more details. */ 

int count = 34;             // number of people
float spacing = 760/count;  // spacing between "nodes"


int selected = 1;
String facts = new String[count];
String years = {"1842", "1893", "1926", "1942", "1943", "1946", "1949", "1949", "1961", "1962", "1965", "1965", "1972", "1973", "1978", "1979", "1980", "1983", "1984", "1984", "1985", "1985", "1986", "1988", "1993", "1993", "1994", "1996", "1997", "2001", "2004", "2005", "2006", "2008"};

// filling the facts array
facts[0] = "Ada Lovelace translates documents for the Analytical Engine and along with the translation provides notes which contains the first algorithm.";
facts[1] = "Henrietta Swan Leavitt becomes one of the Harvard computers where she was able to later assist in the discovery of stars that provided evidence to the expansion of the universe.";
facts[2] = "Grete Hermann publishes the foundational paper for computerized algebra.";
facts[3] = "Hedy Lamarr co-invents frequency-hopping spread-spectrum broadcasting.";
facts[4] = "WREN Colossus operators work to operate Colossus during World War II in order to decrypt German transmissions.";
facts[5] = "Betty Jennings, Betty Snyder, Fran Bilas, Kay McNulty, Marlyn Wescoff, and Ruth Lichterman, program for ENIAC, the first general-purpose electronic computer.";
facts[6] = "Grace Hopper develops the first ever compiler for a computer known as A-0 she would later be one of the primary creators of COBOL.";
facts[7] = "Evelyn Boyd Granville is the second African-American women to receive a Ph.D. in Mathematics. She was a research specialist at the Computation and Data Reduction Center developing computer programs to aid in the trajectory of both the Mercury and Apollo space programs.";
facts[8] = "Dana Ulery, first female engineer at Jet Propulsion Laboratory, developing real-time tracking systems using a North American Aviation Recomp II.";
facts[9] = "Jean E. Sammet develops FORMAC programming language, and would later be the first to write extensively about history and categorisation of programming languages.";
facts[10] = "Mary Allen Wilkes, the first person to use a computer in a private home, becomes the first developer of an operating system (LAP) for the first minicomputer (LINC).";
facts[11] = "Sister Mary Kenneth Keller becomes the first American female with a Doctorate of Computer Science.";
facts[12] = "Karen Spärck Jones introduces inverse document frequency (IDF) weighting in information retrieval.";
facts[13] = "Lynn Conway joins Xerox PARC and leds the LSI Systems group; co-authored Introduction to VLSI Systems.";
facts[14] = "Sophie Wilson designs the Acorn Microcomputer, an early 8-bit microcomputer for hobbyists.";
facts[15] = "Carol Shaw becomes a game designer and programmer for Atari Corp. and Activision. She is considered the first female video game designer.";
facts[16] = "Carla Meninsky becomes a game designer and programmer for Atari 2600 games Dodge 'Em and Warlords.";
facts[17] = "Adele Goldberg is one of the core people to design and develop the Smalltalk language.";
facts[18] = "Roberta Williams works on graphical adventure games for personal computers, particularly the King's Quest series.";
facts[19] = "Susan Kare creates the icons and many of the interface elements for the original Apple Macintosh in the 1980s, and was an original employee of NeXT, working as the Creative Director.";
facts[20] = "Radia Perlman invents the Spanning Tree Protocol. She would later receive the USENIX Lifetime Achievement Award in 2007.";
facts[21] = "Irma Wyman becomes the first Honeywell CIO.";
facts[22] = "Hannah Smith becomes \"Girlie tipster\" for CRASH (magazine).";
facts[23] = "Éva Tardos receives of the Fulkerson Prize for her research on design and analysis of algorithms.";
facts[24] = "Shafi Goldwasser, theoretical computer scientist, receives her first of two Gödel Prizes for her research.";
facts[25] = "Jeannette Wing together with Barbara Liskov develop the Liskov substitution principle.";
facts[26] = "Sally Floyd works on Transmission Control Protocol.";
facts[27] = "Xiaoyuan Tu becomes the first female recipient of the ACM's Doctoral Dissertation Award.";
facts[28] = "Anita Borg becomes the founding director of the Institute for Women and Technology (IWT).";
facts[29] = "Audrey Tang becomes the initiator and leader of the Pugs project.";
facts[30] = "Jeri Ellsworth creates and designs the C64 Direct-to-TV, a single chip-implementation of the Commodore 64.";
facts[31] = "Mary Lou Jepsen becomes the founder and chief technology officer of One Laptop Per Child (OLPC). She later becomes the founder of Pixel Qi.";
facts[32] = "Frances E. Allen becomes the first female recipient of the ACM's Turing Award.";
facts[33] = "Barbara H. Liskov wins the Turing prize.";

PImage imgs = new PImage[count];

float start;
boolean animating = false;

for(int i=0; i<count; i++){
  imgs[i] = loadImage("images/" + i + ".jpg");
}

void setup(){  
  size(800,600);
  background(255); 
}  
  
void draw(){
  background(255);

  fill(0);
  PFont fontA = loadFont("Arial Black");  
  textFont(fontA, 50);
  textAlign(CENTER);
  text("Women in Computing", 400, 100);

  // draw the line
  stroke(#FF0000);
  smooth();
  strokeWeight(5.0);
  strokeCap(ROUND);
  line(20, 300, 760, 300);

  // draw the dots
  strokeWeight(2.0);
  for(int i = 1; i <= count; i = i+1){
    fill(255);
    ellipse(i*spacing, 300, 10, 10);
  }

  // handle animation and play/stop buttons
  stroke(255);
  fill(#FF0000);
  if(animating){
    rect(730, 530, 50, 50);
    play();
  } else {
    triangle(730, 530, 780, 555, 730, 580);
  }

  drawSelectedDot();
  drawFact();
}

void mouseMoved(){
  if(animating){
    // drop out of here
    return;  
  }

  if(mouseY > 290 && mouseY < 310){
    for(int i = 1; i <= count; i = i+1){
      if (mouseX > (i*spacing - 10) && mouseX < (i*spacing+ 10)){
        selected = i;
      }
    }
  }
}

void mouseClicked(){
  if(mouseX > 730 && mouseX < 780 && mouseY > 530 && mouseY < 580){
    //switch states
    animating = !animating;
    start = millis();
  }
}

void play() {
  if(millis() - start >= 5000 && selected < count) {
    selected = selected + 1;
    start = millis();
    return;
  }
  
  if(millis() - start >= 5000 && selected == count) {
    animating = false;
    start = millis();
    selected = 1;
  }
}

void drawSelectedDot() {
    if(selected == -1){
      return;
    }

    fill(255);
    stroke(0);
    ellipse(selected*spacing, 300, 10, 10); 
}

void drawFact() {
  PFont fontA = loadFont("Arial");  
  
  fill(0);

  if(selected != -1){
    // draw image
    image(imgs[selected-1], 90, 400);

    // draw year
    fill(#FF0000);
    textAlign(CENTER);
    textFont(fontA, 10);
    text(years[selected-1], selected*spacing, 280);
    
    // draw fact
    fill(0);
    textAlign(LEFT);
    textFont(fontA, 14);
    text(facts[selected-1], 200, 400, 400, 400);
  }
}
