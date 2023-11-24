extends Node2D

var game_started = false
var move_speed = 200
var turn_speed = 4
var facing = -1

func _physics_process(delta):
	move_local_x(-move_speed*delta)
	player_movement(delta)

func player_movement(_delta):
	if Input.is_action_pressed("left_input"):
		if facing == -1:
			return
		flip_player()
	if Input.is_action_pressed("right_input"):
		if facing == 1:
			return
		flip_player()
	if Input.is_action_pressed("up_input"):
		if rotation * facing < -1.5:
			return
		rotate(-facing * turn_speed * _delta)
	if Input.is_action_pressed("down_input"):
		if rotation * facing > 1.5:
			return
		rotate(facing * turn_speed * _delta)

func _on_area_2d_area_entered(area):
	if area == $Area2D:
		flip_player()

func flip_player():
	scale.x = -scale.x
	facing = -facing

func _on_button_pressed():
	game_started = true
