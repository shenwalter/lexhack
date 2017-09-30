//Pool ball math simulation
//broken stopping mechanism

var w = 100;
var h = 67;
var dt = 0.01;
var screen_color = [100, 20, 250];
var launchSpeed = 20;
var initialFreeTime = 500; //milliseconds
var errorTolerance = 0.5;

function setup () {
	createCanvas(w, h);	
	ball = new Ball();
	ball.initialize([launchSpeed, -launchSpeed]);
}


function draw() {
	background(screen_color[0], screen_color[1], screen_color[2]);
	ball.update(dt);		
	ball.display();
	ball.hit();
	ball.fallInPocket([[0, 0], [w, 0], [w, h], [0, h]]);
	if (keyIsPressed) {
		if (key == "u") {
			ball.vel = multiply(ball.vel, 0.5);
		}
	}
}


function add(x, y) {
  var result = [];
  for(var i = 0; i < x.length; i++) {
    result.push(x[i] + y[i]);
  }
  return (result);
}


function multiply(vector, constant) {
  var result = [];
  for(var i = 0; i < vector.length; i++) {
    result.push(vector[i]*constant);
  }
  return (result);
}


function Ball() {
	this.initialize = function(v0) {
		this.pos = [0, h];
		this.vel = v0;
		this.acc = [0, 0];
		this.r = 1;
	}
	this.update = function(dt) {
		this.pos = add(this.pos, multiply(this.vel, dt));
		this.vel = add(this.vel, multiply(this.acc, dt));
	}
	this.display = function() {
		ellipse(this.pos[0], this.pos[1], this.r*2, this.r*2);
	}
	this.hit = function() {
		if ((this.pos[0] >= w && this.vel[0] > 0) || (this.pos[0] <= 0 && this.vel[0] < 0)){
			this.vel[0] *= -1;
		}   
		if ((this.pos[1] >= h && this.vel[1] > 0) || (this.pos[1] <= 0 && this.vel[1] < 0)){
			this.vel[1] *= -1;
		}
	}
	this.fallInPocket = function(pockets) {
		for (var i = 0; i < pockets.length; i++) {
			if(abs(this.pos[0] - pockets[i][0]) <= errorTolerance && abs(this.pos[1] - pockets[i][1]) <= errorTolerance && millis() > initialFreeTime) {
				this.vel = [0, 0];
				break;
			}
		}
	}
};