extends TileMap

var spawn_dic: Dictionary
# Called when the node enters the scene tree for the first time.
func _ready():
	var positions = get_tree().get_nodes_in_group('SpawnArea')
	for position in positions:
		spawn_dic[position.come_from] = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func get_position_from(level):
	return spawn_dic[level].global_position
