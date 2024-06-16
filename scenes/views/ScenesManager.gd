extends Node2D
class_name SceneManager

@export var player: CharacterBody2D
@export var default_scene: String
var last_level: String
var current_scene: Node
var format_url = "res://scenes/levels/{scene}.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	var packed_scene = load(format_url.format({"scene": default_scene}))
	current_scene = packed_scene.instantiate()
	self.add_child(current_scene)
	last_level = default_scene
	connect_areas()
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _change_scene(new_scene):
	var packed_scene = load(format_url.format({"scene": new_scene}))
	current_scene.queue_free()
	current_scene = packed_scene.instantiate()
	self.add_child(current_scene)

func _on_level_exit(level):
	_change_scene(level)
	var new_player_position = current_scene.get_position_from(last_level)
	player.position = new_player_position
	last_level = level
	print('jojojo')
	connect_areas()

func connect_areas():
	var areas = get_tree().get_nodes_in_group('EsceneExitArea')
	for area in areas:
		area.connect('level_exit',_on_level_exit)
