extends Node

export (bool) var day

func _ready():
	print("Starting food: ", $Player.food)
	print("Starting health: ", $Player.health)
	print("Starting water: ", $Player.water)
	print("Starting heat: ", $Player.heat)

#when the day timer finishes...
func _on_DayTimer_timeout():
	#check if its day or night
	if day == true:
		day = false
		night()

	if day == false:
		day = true
		day()

func day():
	pass #do day things

func night():
	pass #do night things

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
