extends Area2D

signal hit_rock

export (int) var speed

export (int) var food = 100
export (int) var food_max = 100
export (int) var health = 100
export (int) var health_max = 100
export (int) var heat = 100
export (int) var heat_max = 100
export (int) var water = 100
export (int) var water_max = 100

export (int) var rocks = 0

export (int) var rocks = 0

var velocity = Vector2()
var screensize = Vector2(1920, 1080)
var mouse_position

func _ready():
	pass


func start(pos):
	set_process(true)
	position = pos
	$AnimatedSprite.animation = "idle"


func _process(delta):
	get_input()
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
<<<<<<< HEAD
<<<<<<< HEAD
		print("Added 5 food!")
		food += 5
		#if food is more than the max...
		if food > food_max:
			#set food to the max
			food = food_max
=======
=======
>>>>>>> dc988bb200b4aeee71dcfb09fd617e55854cadc2

		#print("Added 5 food!")
		food += 5									## WHEN FOOD IS EATEN, THIS ADDS FOOD

		print ("Subtracted 10 from this rock")		#### 
		emit_signal("hit_rock")						#### ROCK STUFF
		rocks += 10									#### ADDS ROCKS, SENDS OUT A SIGNAL
		print ("Player now has ", rocks, " rocks")	####
<<<<<<< HEAD
>>>>>>> dc988bb200b4aeee71dcfb09fd617e55854cadc2
=======
>>>>>>> dc988bb200b4aeee71dcfb09fd617e55854cadc2
	
	#if food is more than none...
	if food > 0:
		#stop damage timer
		$HungerDamageTimer.stop()


func _on_HungerTimer_timeout():
	#if food is more than none
	if food > 0:
		#subtract 1 food after timer
		food -= 1
	print("Food Left: ", food)
	#if food is none & damage timer is not started already...
	if food <= 0 && $HungerDamageTimer.is_stopped():
		#start damage timer
		$HungerDamageTimer.start()


func _on_HungerDamageTimer_timeout():
	#subtract 5 health after timer
	health -= 5
	print("Health left: ", health)


func _on_HeatTimer_timeout():
	#if heat is more than none
	if heat > 0:
		#subtract 1 heat after timer
		heat -= 1
	print("Heat Left: ", heat)
	#if heat is none & damage timer is not started already...
	if heat <= 0 && $HeatDamageTimer.is_stopped():
		#start damage timer
		$HeatDamageTimer.start()


func _on_HeatDamageTimer_timeout():
	#subtract 5 health after timer
	health -= 10
	print("Health left: ", health)


func _on_WaterTimer_timeout():
	#if water is more than none
	if water > 0:
		#subtract 1 water after timer
		water -= 1
	print("Water Left: ", water)
	#if water is none & damage timer is not started already...
	if water <= 0 && $WaterDamageTimer.is_stopped():
		#start damage timer
		$WaterDamageTimer.start()


func _on_WaterDamageTimer_timeout():
	#subtract 5 health after timer
	health -= 10
	print("Health left: ", health)
