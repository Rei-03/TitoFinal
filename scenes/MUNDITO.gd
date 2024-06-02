extends Node2D
@onready var trans = $Trans/AnimationPlayer

func _on_v_box_container_focus_entered():
	pass # Replace with function body.
	trans.change_scene("res://Escenas/MUNDITO.tscn")
	
