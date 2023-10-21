extends CharacterBody2D

var VELOCITY = Vector2(0, -150)

# Called when the node enters the scene tree for the first time.
func _ready():
	print("bullet shot")

#(instance_from_id(collision_info.get_instance_id()))

func _physics_process(delta):
	var collide = move_and_collide(VELOCITY * delta)
	
	if collide:
		collide.get_collider()
		for item in get_tree().get_nodes_in_group("enemies"):
			print(item.get_children())
			print(collide.get_collider())
			if item.get_child(0) == collide.get_collider():
				item.queue_free()
		
		queue_free()

