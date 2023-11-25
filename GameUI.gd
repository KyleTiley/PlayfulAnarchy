extends Control

func _ready():
	$Score/Label.text = str(Global.score)

func _process(_delta):
	$Score/Label.text = str(Global.score)

func _on_game_end_game(cause_of_death):
	$GameOver.show()
	for child in $"..".get_children():
		if child is Node2D:
			child.hide()
	match cause_of_death:
		"cop":
			$GameOver/Label.text = "Cops got ya..." + '\n' + '\n'+ "We will bust you" + '\n' + "out the slammer"+ '\n' + "to RIOT again!"
		"grenade":
			$GameOver/Label.text = "Died to a 'nade..." + '\n' + '\n' + "Scrape your bits" + '\n' + "off of the floor" + '\n' + "and RIOT again!" 
