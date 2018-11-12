extends Area2D

var rock_amount = 100

func _ready():
	pass

func _process(delta):
	print (rock_amount)

func _on_RockResourceTimer_timeout():
	if rock_amount < 100:
		rock_amount += 5
	if rock_amount > 100:
		rock_amount = 100
	if rock_amount == 100:
		pass