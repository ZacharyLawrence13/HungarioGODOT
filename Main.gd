extends Node

export (bool) var day

func _ready():
	print("Starting food: ", $Player.food)
	print("Starting health: ", $Player.health)

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