extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var lastPosition;
var speed = Vector2(0,0);
var label;
var face;
var facetStartPos = Vector2(64,64);
var follow = false;
		

# Called when the node enters the scene tree for the first time.
func _ready():
	lastPosition = OS.get_window_position()
	speed = Vector2(0,0)
	label = get_node("Label")
	face = get_node("face")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var currentPos = OS.get_window_position()
	speed += (lastPosition - currentPos) * delta
	
	var returnSpeed = delta * 3.2
	
	if (follow):
		if (speed.x > 0):
			speed.x = clamp(speed.x - returnSpeed, 0, speed.x);
		if (speed.y > 0):
			speed.y = clamp(speed.y - returnSpeed, 0, speed.y);
		if (speed.x < 0):
			speed.x = clamp(speed.x + returnSpeed, speed.x, 0);
		if (speed.y < 0):
			speed.y = clamp(speed.y + returnSpeed, speed.y, 0);
	lastPosition = currentPos
	if (label != null):
		label.set_text(str(speed.x) + ' ' + str(speed.y))
	if (face != null):
		face.position = (facetStartPos + speed * face.texture.get_size())
	pass
