extends Area2D

signal die

signal food_minus
signal heat_minus
signal water_minus
signal health_minus

export (int) var speed

export (int) var health = 100
export (int) var health_max = 100

export (int) var food = 100
export (int) var food_max = 100
export (int) var food_damage = 5

export (int) var heat = 100
export (int) var heat_max = 100
export (int) var heat_damage = 5

export (int) var water = 100
export (int) var water_max = 100
export (int) var water_damage = 5

export (int) var rocks = 0

var velocity = Vector2()
var screensize = Vector2(1920, 1080)
var mouse_position

func _ready():
	$AnimatedSprite.animation = "idle"


func start(pos):
	set_process(true)
	position = pos

func _process(delta):
	get_input()
	check_stats()
	position += velocity * delta


func get_input():
	velocity = Vector2()    
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	if velocity.length() > 0:    
		velocity = velocity.normalized() * speed   
	mouse_position = get_local_mouse_position()
	rotation += mouse_position.angle() +1.55
	
	#Cancel button for in game
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


	#THIS IS ONLY TEMP
	#when space is pressed...
	if Input.is_action_just_pressed("ui_select"):
		print("Added 5 food!")
		food += 5
		#if food is more than the max...


	if Input.is_action_just_pressed("ui_attack"):
		$AnimatedSprite.animation = "attack"
		print ($AnimatedSprite.animation)
		print ("Subtracted 10 from this rock")		#### 
		emit_signal("hit_rock")						#### ROCK STUFF
		rocks += 10									#### ADDS ROCKS, SENDS OUT A SIGNAL
		print ("Player now has ", rocks, " rocks")	####
		
	if Input.is_action_just_released("ui_attack"):
		$AnimatedSprite.animation = "idle"


func check_stats():
	#if food is more than none...
	if food > 0:
		#stop damage timer
		$HungerDamageTimer.stop()

	if food > food_max:
		#set food to the max
		food = food_max

	if heat > 0:
		$HeatDamageTimer.stop()

	if heat > heat_max:
		heat = heat_max

	if water > 0:
		$WaterDamageTimer.stop()

	if water > water_max:
		water = water_max

	if health > health_max:
		health = health_max
		
	if health <= 0:
		pass
		#signal("die")


func _on_HungerTimer_timeout():
	if food > 0:
		#subtract 1 food after timer
		food -= 1
		emit_signal("food_minus")
	print("Food Left: ", food)
	#if food is none & damage timer is not started already...
	if food <= 0 && $HungerDamageTimer.is_stopped():
		#start damage timer
		$HungerDamageTimer.start()


func _on_HungerDamageTimer_timeout():
	#subtract 5 health after timer
	health -= food_damage
	emit_signal("health_minus")
	print("Health left: ", health)


func _on_HeatTimer_timeout():
	#if heat is more than none
	if heat > 0:
		#subtract 1 heat after timer
		heat -= 1
		emit_signal("heat_minus")
	print("Heat Left: ", heat)
	#if heat is none & damage timer is not started already...
	if heat <= 0 && $HeatDamageTimer.is_stopped():
		#start damage timer
		$HeatDamageTimer.start()


func _on_HeatDamageTimer_timeout():
	#subtract 5 health after timer
	health -= heat_damage
	emit_signal("health_minus")
	print("Health left: ", health)


func _on_WaterTimer_timeout():
	#if water is more than none
	if water > 0:
		#subtract 1 water after timer
		water -= 1
		emit_signal("water_minus")
	print("Water Left: ", water)
	#if water is none & damage timer is not started already...
	if water <= 0 && $WaterDamageTimer.is_stopped():
		#start damage timer
		$WaterDamageTimer.start()


func _on_WaterDamageTimer_timeout():
	#subtract 5 health after timer
	health -= water_damage
	emit_signal("health_minus")
	print("Health left: ", health)
