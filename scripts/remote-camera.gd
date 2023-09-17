extends RemoteTransform3D

var speed = 3
var minz = 12
var maxz = 30
var movement = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("zoom_in"):
		movement += speed
	
	if Input.is_action_just_pressed("zoom_out"):
		movement -= speed
	
	if movement > 0:
		movement -= 1
		position.z -= 1
	if movement < 0:
		movement += 1
		position.z += 1

	if position.z < minz:
		position.z = minz
	if position.z > maxz:
		position.z = maxz
