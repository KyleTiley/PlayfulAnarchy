extends Node2D

var score = 0 

signal StartGame
signal EndGame

func _on_play_button_pressed():
	start_game()

func start_game():
	StartGame.emit()

func game_over(cause_of_death):
	EndGame.emit(cause_of_death)

func restart_game():
	get_tree().reload_current_scene()
