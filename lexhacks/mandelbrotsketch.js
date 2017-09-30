//Alek Westover

var minval =  -0.5;
var maxval = 0.5;
var min_slider;
var max_slider;

var max_iterations = 50;
var p_inf = 16;

function setup() {
	createCanvas(200, 200);
	pixelDensity(1);
	loadPixels();
	min_slider = createSlider(-2.5, 0, -2.5, 0.01);
	max_slider = createSlider(0, 2.5, 2.5, 0.01);
}

function draw() {
	for (var x = 0; x < width; x++) {
		for (var y = 0; y < height; y++) {
			
			var a = map(x, 0, width, min_slider.value(), max_slider.value());
			var b = map(y, 0, height, min_slider.value(), max_slider.value());
			var ca = a;
			var cb = b;

			for (var n = 0; n < max_iterations; n++) {
				var aa = a * a - b * b;
				var bb = 2 * a * b;
				var bright = 0;
				a = aa + ca;
				b = bb + cb;
				if (a*a + b*b > p_inf) {
					break;
				}
			}
			bright = map(n, 0, max_iterations, 0, 255);
			var pix = (x + y *width) * 4;
			pixels[pix + 0] = bright;
			pixels[pix + 1] = bright;
			pixels[pix + 2] = bright;
			pixels[pix + 3] = 255;
		}
	}
	updatePixels();
}


/*
//incredibly simple pong like thing

function setup() {
	createCanvas(320, 240);
}
function draw() {
	console.log("ye");
	background(0);
	ellipse(x, 120, 16, 16);
	x = x + 1
	if (x>width) {
		x = 0;
	}
}

*/