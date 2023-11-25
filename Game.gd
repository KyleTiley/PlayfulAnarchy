extends Node2D

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

func _on_try_again_pressed():
	restart_game()
	Global.score = 0
