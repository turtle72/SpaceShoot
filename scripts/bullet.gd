extends CharacterBody2D

var VELOCITY = Vector2(0, -150) #x,y and up is down and down is up

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
#	print("bullet shot")


func _physics_process(delta):
	var collide = move_and_collide(VELOCITY * delta)
	
	
	if collide:
		
		for item in get_tree().root.get_node("Node2D/player/enemies").get_children():
			if collide.get_collider() == item:
				collide.get_collider().health = collide.get_collider().health - 1
		
		print(get_tree().get_nodes_in_group("enemies")[0].get_children())
		queue_free() # remove bullet

