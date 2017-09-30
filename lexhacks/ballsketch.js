//Awestover
//Cool background thingy

var dt = 0.2;
var t = 0;
var browser_text;
var balls = [];
var num_balls = 10;
var scl = 11;

function setup() {
	createCanvas(200, 200);
	pixelDensity(1);
	loadPixels();
	for (var i = 0; i < num_balls; i++) {
		balls.push(new Ball());
	}
	browser_text = createP('');
}

function draw() {
	for (var x_i = 0; x_i < width; x_i++) {
		for (var y_i = 0; y_i < height; y_i++) {
			var color_sum = 0;
			for (var i = 0; i < num_balls; i++) {
				color_sum += 10*balls[i].initial_radius/dist(balls[i].pos.x, balls[i].pos.y, x_i, y_i);
			}
			pixels[x_i + y_i*height] = color_sum;
		}
	}
	updatePixels();

	for (var i = 0; i < num_balls; i++) {
		balls[i].show();
		balls[i].update(dt);
		balls[i].sine_radius_oscilate(t);	
		balls[i].hit_edge();
	}

	t += 0.1*dt;
}