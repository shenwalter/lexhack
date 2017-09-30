function Blob () {
	this.radii = [];
	this.thetas = [];
	this.num_pts = 20;
	this.initial_radius = 30;
	for (var i = 0; i < this.num_pts; i++) {
		this.thetas.push(i*TWO_PI/this.num_pts);
		this.radii.push(this.initial_radius);
	}

	this.pos = createVector(width/2, height/2);
	this.vel = createVector(floor(30*random()), 20);
	this.acc = createVector(0, 0);
};


Blob.prototype.update = function(dt) {
	this.pos.add(this.vel.copy().mult(dt));
	this.vel.add(this.acc.copy().mult(dt));
}


Blob.prototype.show = function() {
	fill(0, 0, 0, 50);
	noStroke();
	var c_pts = this.gen_circle_pts();
	beginShape();
	for (var i = 0; i < this.num_pts; i++) {
		vertex(c_pts[i].x, c_pts[i].y);
	}
	endShape(CLOSE);
} 


Blob.prototype.gen_circle_pts = function() {
	var circle_pts = [];
	var shifter = createVector(0, 0);
	for (var i = 0; i < this.thetas.length; i++) {
		shifter.set(this.radii[i]*cos(this.thetas[i]), this.radii[i]*sin(this.thetas[i]));
		circle_pts.push(this.pos.copy().add(shifter));
	}
	return (circle_pts);
}


Blob.prototype.sine_radius_oscilate = function(t) {
	for (var i = 0; i < this.radii.length; i++) {
		this.radii[i] = this.initial_radius + (this.initial_radius/10)*sin(i*TWO_PI/this.radii.length) + (this.initial_radius/2)*noise(i + t);
	}
}


Blob.prototype.hit_edge = function() {
	var len_rad = 0.5 * this.initial_radius;
	if (this.pos.x + len_rad > width || this.pos.x < len_rad) {
		this.vel.x *= -1;
	}
	if (this.pos.y + len_rad > height || this.pos.y < len_rad) {
		this.vel.y *= -1;
	}  
}