extends Control

func _on_play_button_pressed():
	self.hide()

func _on_rules_button_pressed():
	$Rules.show()

func _on_close_button_pressed():
	$Rules.hide()

