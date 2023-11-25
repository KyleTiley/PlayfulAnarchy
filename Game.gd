extends Node2D

signal StartGame

func _on_play_button_pressed():
	start_game()

func start_game():
	StartGame.emit()
