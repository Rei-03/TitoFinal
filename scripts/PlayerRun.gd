extends State


# Called when the node enters the scene tree for the first time.
func on_enter(last_state):
	animation_player.play('Run')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta):
	var axis = Input.get_axis('ui_left', 'ui_right')
	if not axis:
		parent.transition_to('Idle')
	
	character_body.velocity.x = axis * parent.properties.velocity
	
	if character_body.velocity.x < 0:
		parent.skeleton.scale.x = -1
	elif character_body.velocity.x > 0:
		parent.skeleton.scale.x = 1
	if not character_body.is_on_floor():
		parent.transition_to('Fall')
	if Input.is_action_just_pressed('ui_accept'):
		parent.transition_to('Jump')
