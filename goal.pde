class Goal{
	float x, y;

	//Coords of the collision area
	float boundX;
	float boundY;
	float boundW;
	float boundH;

	Goal(){
		this.x = 0;
		this.y = 0;

		this.boundX = 0;
		this.boundY = this.y;
		this.boundW = 200;
		this.boundH = height;
	}

	void draw(){
		fill(255, 0, 0, 190);
		rect(this.boundX, this.boundY, this.boundW, this.boundH);
	}

	boolean collided(Puck puck){
		return puck.xPos < 225;
	}
}