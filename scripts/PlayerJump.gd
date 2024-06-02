extends State
class_name Jump

var can_jump = true

func on_enter(last_state):
	$JumpTimer.start()
	can_jump = true
	animation_player.play('Jump')

func physics_process(delta):
	character_body.velocity.x = Input.get_axis('ui_left', 'ui_right') * parent.properties.velocity
	character_body.velocity.y = parent.properties.jump_velocity
	
	if character_body.velocity.x < 0:
		parent.skeleton.scale.x = -1
	elif character_body.velocity.x > 0:
		parent.skeleton.scale.x = 1
	
	if not can_jump or Input.is_action_just_released('ui_accept'):
		parent.transition_to('Fall')
	
	
func on_exit():
	$JumpTimer.stop()
	can_jump = true

func _on_jump_timer_timeout():
	can_jump = false
