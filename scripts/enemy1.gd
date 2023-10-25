extends CharacterBody2D

var health = 1
var speed = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health == 0:
		for item in get_tree().root.get_node("Node2D/player").enemyList:
			if get_tree().root.get_node("Node2D/player").enemyList[item]["enemyInstance"] == self:
				get_tree().root.get_node("Node2D/player").enemyList.erase(item)
		get_tree().get_nodes_in_group("audio")[1].play()

		queue_free()
