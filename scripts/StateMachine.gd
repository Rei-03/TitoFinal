extends Node
class_name StateMachine

@export var default_state: State
@export var animation_player: AnimationPlayer
@export var skeleton: Skeleton2D

@onready var character_body: CharacterBody2D = self.get_parent()  

var states = { }
var current_state: State

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity") * 4

var properties = {
	'jump_velocity': -400,
	'velocity': 350,
	'gravity': gravity
}

# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = default_state
	for child: State in self.get_children():
		child.parent = self
		child.animation_player = animation_player
		child.character_body = character_body
		states[child.name] = child
	current_state.on_enter(null)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	current_state.process(delta)
	
	
func _physics_process(delta):
	current_state.physics_process(delta)

func transition_to(state_name):
	current_state.on_exit()
	var last_state = current_state.name
	current_state = states[state_name]
	current_state.on_enter(last_state)
