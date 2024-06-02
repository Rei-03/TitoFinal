extends State
class_name Idle

var paren_node = self.get_parent()
# Called when the node enters the scene tree for the first time.
func on_enter(last_state):
	animation_player.play('Idle')	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func physics_process(delta):
	if Input.get_axis('ui_left', 'ui_right'):
		parent.transition_to('Run')
	if Input.is_action_just_pressed('ui_accept'):
		parent.transition_to('Jump')
	if not character_body.is_on_floor():
		parent.transition_to('Fall')
	character_body.velocity.x = 0
