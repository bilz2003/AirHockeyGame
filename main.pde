Mallet mallet; //Mallet object
ArrayList<Puck> pucks; // The Pucks will be stored in an arraylist
Goal goal;

int rem; //will be used to remove the enemy after it has been killed
int score=150;
BufferedReader reader;

PFont font; // variablle to store custom font
String fontName = "MinecraftRegular-Bmg3.otf";
int fontSize = 24;


boolean menu, game, gameover, newScore;


// ---------- PROCESSING FUNCTIONS --------------
void setup(){
	size(800, 400);

	font = createFont(fontName, fontSize); // Initialzing custom font
	textFont(font, fontSize); //Setting the font

	reset();
}

void draw(){
	if(menu){
		Menu();
	}else if (game) {
		Game();
	}
}

// ------------------- INPUT -------------------
void mousePressed(){
	if(menu){
		menu = false;
		if(mouseButton == LEFT)	game = true;
	}
}

void keyPressed(){
	println("key: "+key);
	if(key == 'r'){
		reset();
	}
}

// --------------- USEFUL FUNCTIONS ------------

void Menu(){
	background(0); //Setting the white background
	textAlign(CENTER);
	textSize(30);
	text("This is a Air Hockey game. \n Here you have to stop the Puck \n before it reaches to the Goal.", width/2, height/2-50); // Drawing the score
	fill(255, 255, 255); //refreshes the screen
}

void Game(){
	background(0); //Setting the white background
	fill(255, 255, 255);
	textSize(fontSize);
	text("Score: "+ score, width-100, 20); // Drawing the score
	// text("Hi-score: "+ highscore, 100, 20); // Drawing the score

	// highscore = updateHighScore();

	goal.draw();

	// if (int(random(1, 50)) == 5) pucks.add(new Puck()); // Randomly adds Pucks

	mallet.update(); //Updates the Mallet's position
	fill(0); //refreshes the screen
	// Iterating through Pucks to check if any zomb is been swatted
	for(int i = 0; i < 2; i++){
		Puck pk = pucks.get(i);
		if(collision(pk, mallet)){
			pk.reverS();
			mallet.hitt = true;
		}else{
			// println("False");
			mallet.hitt = false;
		}
		rem = pk.update(); // updates and also checks the time 
		pk.render(); // drawing Pucks
		if(goal.collided(pk)){
			score -= 10;
			pk.reset();
		}
	}

	mallet.render(); // drawing Mallet

	if(score <=0){
		Gameover();
	}
}

void Gameover(){
	fill(0, 0, 0, 200);
	rect(0, 0, width, height);
	fill(255, 255, 255);
	textSize(50);
	textAlign(CENTER);
	text("Game Over", width/2, height/2);
	textSize(20);
	text("Score: "+score, width/2, height/2+30);
	if(newScore){
		fill(255, 0, 0);
		text("Congratulations new Hi-Score", width/2, height/2+60);
	}
	textSize(30);
	text("Press R to restart", width/2, height-30);
	noLoop();
}

void reset(){
	mallet = new Mallet(); // Initialzing Mallet object
	pucks = new ArrayList<Puck>(); // Initialzing array object that will store Pucks
	goal = new Goal();

	for(int i= 0; i < 3; i++){
		pucks.add(new Puck(height/4 + i*50*2));
	}

	menu = true;
	game = false;
	gameover = false;
	newScore = false;

	score = 150;

	loop();
}


boolean collision(Puck pk, Mallet mlt){
	return pk.puckR+mlt.widthM/2 > dist(pk.xPos, pk.yPos, mlt.centerX, mlt.centerY);
}

