extends CharacterBody2D

var health = 1
var speed = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health == 0:
		get_tree().get_nodes_in_group("audio")[1].play()
		queue_free()
