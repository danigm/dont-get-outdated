extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update(world):
	var player = world.player
	$burnout.text = "burnout: %02d%%" % player.burnout
	$security.text = "security: %02d%%" % player.security
	$server.text = "server: %02d%%" % player.server
