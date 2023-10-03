extends Node

enum Scrum {PLANNING, DAILY, REVIEW, RETROSPECTIVE}
# phase duration in seconds
@export var phase_duration = [10, 10, 10, 10] 
@export var epoch: int = 0
@export var phase_time: int = 0
@export var phase = Scrum.DAILY
@export var sprint: int = 0
var player = null

func update(time_passed):
	epoch += int(time_passed)
	phase_time += time_passed
	if phase_time >= phase_duration[phase]:
		phase = (phase + 1) % 4
		phase_time = 0
		if phase == Scrum.PLANNING:
			sprint += 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
