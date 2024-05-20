class Mallet{
	//x, y coords
	float xPos = width/2;
	float yPos = height/2;
	float xVel = 0, yVel = 0;
	float widthM, heightM;
	float centerX, centerY;

	//Coords of the collision area
	float boundX = width/2;
	float boundY = height/2;

	boolean hitt = false;

	//Images of hitting state and normal state
	PImage img;

	//Checks if hitting action is performed
	boolean pressed = false;

	// Constructor, only inits the images
	Mallet(){
		this.img = loadImage("Images/mallet.png");
		this.widthM = img.width;
		this.heightM = img.height;
		this.centerX = this.xPos+this.widthM/2;
		this.centerY = this.yPos+this.heightM/2;
	}

	void follow(float x, float y){
		this.xVel = 0;
		this.yVel = 0;

		float diffX = x - this.xPos;
		float diffY = y - this.yPos;

		float distance = pow(pow(diffX, 2) + pow(diffY, 2), 0.5);
		if (distance <= 1){
			this.xVel = 0;
			this.yVel = 0;
		}else{
			this.xVel = (diffX/distance)*3;
			this.yVel = (diffY/distance)*3;
		}

		this.xPos += (int)this.xVel;
		this.yPos += (int)this.yVel;

		if (this.xPos < 200) {
			this.xPos = 200;
		}

		this.centerX = this.xPos+this.widthM/2;
		this.centerY = this.yPos+this.heightM/2;
	}

	//Updates the swatters position to the latest mouse coords
	void update(){
		if(mousePressed) {
			boundX = mouseX;
			boundY = mouseY;
		}
		if(hitt) {
			boundX = this.xPos;
			boundY = this.yPos;
		}
		this.follow(boundX, boundY);
	}

	//Draws the swatter 
	void render(){
		image(img, this.xPos, this.yPos);
	}
}
