extends Node3D

class_name Main


enum Scrum {PLANNING, DAILY, REVIEW, RETROSPECTIVE}
# phase duration in seconds
var phase_duration = [10, 10, 10, 10] 
var ephoc = 0
var phase_time = 0
var phase = Scrum.DAILY
var sprint = 0
@onready var timer = $Timer

# Called when the node enters the scene tree for the first time.
func _ready():
	timer.timeout.connect(_on_timer_timeout)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	ephoc += 1
	phase_time += 1
	if phase_time >= phase_duration[phase]:
		phase = (phase + 1) % 4
		phase_time = 0
		if phase == Scrum.PLANNING:
			sprint += 1

	get_node("HUD/scrum").update(sprint, phase, phase_duration[phase], phase_time)
