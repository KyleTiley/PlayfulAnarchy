extends Control

signal start_game

func _on_button_pressed():
	print("YES")
	self.hide()
	start_game.emit()
