extends CharacterBody2D
#get_viewport_rect().size



const SPEED = 125.0
var rng = RandomNumberGenerator.new()
var score = 0
var enemyList = {}

func _ready():
	spawnEnemy([1,1,2,1])
	print(get_node("enemies").get_children())


func spawnEnemy(enemy):
	var nodeId = 0
	for item in enemy: #spawn enemies
		nodeId += 1
		print(nodeId)
		enemyList["enemy"+str(nodeId)] = {}
		enemyList["enemy"+str(nodeId)]["enemyScene"] = load("res://scenes/enemyScenes/enemy" + str(item) + ".tscn")
		enemyList["enemy"+str(nodeId)]["enemyInstance"] = enemyList["enemy"+str(item)]["enemyScene"].instantiate()
		get_node("enemies").add_child(enemyList["enemy"+str(item)]["enemyInstance"])
		enemyList["enemy"+str(nodeId)]["enemyInstance"].position = Vector2(randi_range(-120,120),randi_range(-110,-10))
		enemyList["enemy"+str(nodeId)]["pos"] = enemyList["enemy"+str(item)]["enemyInstance"].position
		
	

func get_input():
	var input_dir = Input.get_vector("left","right","empty","empty")
	velocity = input_dir * SPEED
	if position.x - input_dir.x <= -115:
		velocity = Vector2(100,0)
	if position.x + input_dir.x >= 115:
		velocity = Vector2(-100,0)


func _physics_process(delta):
	get_input() 
	move_and_collide(velocity * delta)

func _process(delta):
	pass
	

func _input(event):
	if event.is_action_pressed("shoot"):
		$shootAudio.play()

		var scene = preload("res://scenes/bullet.tscn")
		var instance = scene.instantiate()
		get_node("Bullets").add_child(instance)
		instance.set_position(Vector2(position.x,(position.y+90)))

