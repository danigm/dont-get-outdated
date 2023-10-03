extends Node3D

@export var world_scene: PackedScene
@onready var world = world_scene.instantiate()

# Called when the node enters the scene tree for the first time.
func _ready():
	world.player = $Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	world.update($Timer.wait_time)
	$HUD/scrum.update(world)
	$HUD/status.update(world)
	$Player.update(world)


func _on_player_walk(x):
	var local = $GridMap.to_local(x)
	var m = $GridMap.local_to_map(local)
	var a = $GridMap.get_cell_item(m)
	print(a)
