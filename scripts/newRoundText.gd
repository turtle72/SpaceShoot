extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	print(get_tree().root.get_node("Node2D/player").enemyList)
	if get_tree().root.get_node("Node2D/player/enemies").get_child_count() == 0:
		self.visible = true
