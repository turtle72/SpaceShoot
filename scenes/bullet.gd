extends CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	print("bullet shot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.position.y -= 5
#	print('test')
