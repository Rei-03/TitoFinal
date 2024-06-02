extends State
class_name FallState

var coyote_time = true

func on_enter(last_state):
	animation_player.play('Fall')
	if last_state == 'Jump':
		coyote_time = false
	else:
		$CoyoteTimer.start()
	
func on_exit():
	$CoyoteTimer.stop()
	
func physics_process(delta):
	character_body.velocity.x = Input.get_axis('ui_left', 'ui_right') * parent.properties.velocity
	character_body.velocity.y = min(character_body.velocity.y + parent.properties.gravity * delta, 400)
	if character_body.velocity.x < 0:
		parent.skeleton.scale.x = -1
	elif character_body.velocity.x > 0:
		parent.skeleton.scale.x = 1
	
	if coyote_time and Input.is_action_just_pressed('ui_accept'):
		parent.transition_to('Jump')
		coyote_time = false
	
	if character_body.is_on_floor():
		coyote_time = true
		parent.transition_to('Idle')
	

func process(delta):
	pass
	
func _on_coyote_timer_timeout():
	coyote_time = false
	print('mondongo')
