extends Control
#
#func _ready():
#	$Score/Label.text = str(Game.score)
#
#func _process(_delta):
#	$Score/Label.text = str(Game.score)
#
#func _on_game_end_game(cause_of_death):
#	$Score.hide()
#	$GameOver.show()
#	match cause_of_death:
#		"cop":
#			$GameOver/Label.text = "Cop killed you"
#		"grenade":
#			$GameOver/Label.text = "Nade killed you"
