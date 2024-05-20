class Puck{
	//x, y coords
	float xPos = 0, yPos = 0, xVel = 2, yVel = 2;

	boolean didHit = false;

	//Width and height
	float puckR = 25;

	Puck(float y){
		this.xPos = width*.75;
		this.yPos = y;
		if (random(0, 1) <= 1){
			yVel = -yVel;
		}
	}

	int update(){
		this.xPos += this.xVel;
		this.yPos += this.yVel;

		if((this.yPos >= height - puckR) || (this.yPos <= puckR)){
			yVel = -yVel;
		}
		if(this.xPos >= width - this.puckR){
			xVel = -xVel;
		}
		return 0;
	}

	void render(){
		fill(190, 0, 0);
		ellipse(xPos, yPos, 50, 50);
	}

	void reset(){
		this.xPos = width - this.puckR;
	}

	void reverS(){
		this.xPos -= this.xVel*3;
		this.yPos -= this.yVel*3;

		this.xVel = -this.xVel;
		this.yVel = -this.yVel;
	}
}