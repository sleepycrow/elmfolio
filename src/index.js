import "./assets/style.css";
import { Elm } from "./Main.elm";

const app = Elm.Main.init();

app.ports.heroWasLoaded.subscribe(() => {
	readjustGrid(false)
})
window.addEventListener("resize", () => { readjustGrid(true) })


/// GRID
//TODO: rewrite
var stripeDistance = 100; // the distance (in px) between stripes
var stripeWidth = 1; // the width (also in px) of the stripes
var stripeInterval = 150; // the amount of time to wait between starting to draw one stripe and another
var distancePerMs = 1; // the amount of pixels to draw each millisecond
var stripeColor = "#777";

function startDrawing(canvas, skipDraw = false){
	// Timers and such
	var totalTimer = 0, stripeTimer = 0;

	// Get canvas rendering context
	var ctx = canvas.getContext('2d');

	// Calculate the amount of stripes to draw and total time required to draw them
	var totalStripesX = Math.ceil(canvas.width / (stripeDistance + stripeWidth));
	var totalStripesY = Math.ceil(canvas.height / (stripeDistance + stripeWidth));
	var totalTimeToDrawX = (totalStripesX * stripeInterval) + (canvas.width / distancePerMs);
	var totalTimeToDrawY = (totalStripesY * stripeInterval) + (canvas.height / distancePerMs);

	if(skipDraw)
		totalTimer = Math.max(totalTimeToDrawX, totalTimeToDrawY)

	console.log(canvas.width, canvas.height, totalStripesX, totalStripesY, totalTimeToDrawX, totalTimeToDrawY);

	// Create and start the draw loop
	var lastTimestamp = performance.now();
	var i = 0;
	var step = (ts) => {
		// calculate delta time since last frame
		let dt = (ts - lastTimestamp);
		lastTimestamp = ts;
		
		// timers and such...
		totalTimer += dt;
		stripeTimer += dt;
		
		// clear canvas, redraw background
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		
		ctx.fillStyle = stripeColor;
		//draw the vertical stripes
		for(i = 0; i < totalStripesX; i++){
			ctx.fillRect(
			((i + 1) * stripeDistance) + (i * stripeWidth),
			0,
			stripeWidth,
			(totalTimer - (stripeInterval * i)) * distancePerMs
		);
		}
		
		//draw the horizontal stripes
		for(i = 0; i < totalStripesY; i++){
			ctx.fillRect(
			0,
			((i + 1) * stripeDistance) + (i * stripeWidth),
			(totalTimer - (stripeInterval * i)) * distancePerMs,
			stripeWidth
		);
		}

			// request another frame, if needed
		if(totalTimer < totalTimeToDrawX || totalTimer < totalTimeToDrawY) window.requestAnimationFrame(step);
		else console.log("finished drawing grid, terminating.");
	};

	window.requestAnimationFrame(step); // request first frame
}

function readjustGrid(skipDraw = false){
	let heroSize = document.getElementById('hero').getBoundingClientRect()
	let canvas = document.getElementById('grid');

	canvas.width = heroSize.width;
	canvas.height = heroSize.height;

	startDrawing(canvas, skipDraw);
}
