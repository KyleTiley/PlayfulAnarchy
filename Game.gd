extends Node2D

signal StartGame
signal EndGame

func _on_play_button_pressed():
	start_game()

func start_game():
	StartGame.emit()

func end_game():
	EndGame.emit()

func restart_game():
	get_tree().reload_current_scene()
