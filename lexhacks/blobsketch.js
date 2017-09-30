//Awestover
//Blober thingy

var dt = 0.2;
var blob;
var browser_text;
var t = 0;

function setup() {
	console.log("SETTING UP");
	createCanvas(400, 400);
	blob = new Blob();
	browser_text = createP('');
}

function draw() {
	//if (floor(t/dt) % 2 == 0) {
	background(255, 255, 255);
	//}
	blob.show();
	blob.update(dt);
	blob.sine_radius_oscilate(t);	
	blob.hit_edge();
	t += 0.1*dt;
}