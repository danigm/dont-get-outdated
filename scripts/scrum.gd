extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func update(world):
	var sprint = world.sprint
	var phase = world.phase
	var phase_duration = world.phase_duration[phase]
	var phase_time = world.phase_time
	
	var percentage = 0
	if phase_time > 0:
		percentage = (phase_time / float(phase_duration)) * 100
	$phase.update(phase, percentage)
	$sprint.text = "sprint: %d" % sprint
