extends Control

func _on_play_button_pressed():
	self.hide()
	$"../Game/GameUI".show()
	$"../UI_Click".play()

func _on_rules_button_pressed():
	$Rules.show()
	$TextureRect.hide()
	$"../UI_Click".play()

func _on_close_button_pressed():
	$Rules.hide()
	$TextureRect.show()
	$"../UI_Click".play()
