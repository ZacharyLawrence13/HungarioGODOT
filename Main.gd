extends Node

export (bool) var day = true

func _ready():
	print("Starting food: ", $Player.food)
	print("Starting health: ", $Player.health)
	print("Starting water: ", $Player.water)
	print("Starting heat: ", $Player.heat)
	print("Day is: ", day)

#when the day timer finishes...
func _on_DayTimer_timeout():
	#check if its day or night
	if day == true:
		day = false
		print("Day is: ", day)
		night()
		pass


	elif day == false:
		day = true
		print("Day is: ", day)
		day()


func day():
	$Player/HeatTimer.wait_time = 8

func night():
	$Player/HeatTimer.wait_time = 4

func _on_Player_food_minus():
	if $HUD/Statpanel/HungerBar.value > 0:
		$HUD/Statpanel/HungerBar.value = $Player.food


func _on_Player_heat_minus():
	if $HUD/Statpanel/HeatBar.value > 0:
		$HUD/Statpanel/HeatBar.value = $Player.heat


func _on_Player_water_minus():
	if $HUD/Statpanel/WaterBar.value > 0:
		$HUD/Statpanel/WaterBar.value = $Player.water


func _on_Player_health_minus():
	if $HUD/Statpanel/HealthBar.value > 0:
		$HUD/Statpanel/HealthBar.value = $Player.health


func _on_Player_food_plus():
	pass # replace with function body


func _on_Player_heat_plus():
	$HUD/Statpanel/HeatBar.value = $Player.heat


func _on_Player_water_plus():
	pass # replace with function body


func _on_Player_health_plus():
	pass # replace with function body


func _on_Player_body_entered(body):
	if body.is_in_group("fire"):
		print("colliding with: ", body)
		$Player/AddHeatTimer.start()
