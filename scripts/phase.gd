extends Label

var Texts = ["planning", "daily", "review", "retrospective"]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func update(phase, percentage):
	text = "scrum: %s %02d%%" % [Texts[phase], percentage]
