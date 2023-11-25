extends Control

func _ready():
	$Score/Label.text = str(Game.score)

func _process(_delta):
	$Score/Label.text = str(Game.score)
