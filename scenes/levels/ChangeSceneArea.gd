extends Area2D

@export var go_to: String

signal level_exit(level)
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	level_exit.emit(go_to)
	
