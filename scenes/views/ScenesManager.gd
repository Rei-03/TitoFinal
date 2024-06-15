extends Node2D
class_name SceneManager

@export var default_scene: String
var current_scene: Node
var format_url = "res://scenes/levels/{scene}.tscn"
# Called when the node enters the scene tree for the first time.
func _ready():
	var packed_scene = load(format_url.format({"scene": default_scene}))
	current_scene = packed_scene.instantiate()
	self.add_child(current_scene)
	
	get_tree().get_nodes_in_group('ExitArea')
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


