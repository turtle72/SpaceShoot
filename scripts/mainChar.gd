extends CharacterBody2D


const SPEED = 125.0
var score = 0
var highScore = 0

func _ready():
	var enemyScene = load("res://scenes/enemyScenes/enemy1.tscn")
	var enemyInstance = enemyScene.instantiate()
	get_parent().get_node("enemies").add_child(enemyInstance)
	print(get_parent().get_node("enemies").get_children())

func get_input():
	var input_dir = Input.get_vector("left","right","empty","empty")
	velocity = input_dir * SPEED
	if position.x - input_dir.x <= -115:
		velocity = Vector2(100,0)
	if position.x + input_dir.x >= 115:
		velocity = Vector2(-100,0)

func _process(_delta):
	pass
	
func _physics_process(delta):
	get_input() 
	move_and_collide(velocity * delta)

func _input(event):
	if event.is_action_pressed("shoot"):
		var scene = preload("res://scenes/bullet.tscn")
		var instance = scene.instantiate()
		get_node("Bullets").add_child(instance)
		instance.set_position(Vector2(position.x,(position.y+90)))

