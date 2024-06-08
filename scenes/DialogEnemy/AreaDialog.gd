extends Area2D

@export var path: String

signal start_dialog(path)
@onready var label:Label = get_node("../Label")
var on_area:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", _on_area_dialog_body_entered)
	connect("body_exited", _on_area_dialog_body_exited)
	label.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("interact") and on_area:
		start_dialog.emit(path)

func _on_area_dialog_body_entered(body):
	label.visible = true
	on_area = true
	
func _on_area_dialog_body_exited(body):
	label.visible = false
	on_area = false
