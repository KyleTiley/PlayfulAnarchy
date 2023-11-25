extends Node2D

var game_started = false
var move_speed = 200
var turn_speed = 4
var facing = -1
var count = 0 
var flip_gate = 0.5
var flip_counter = flip_gate

func _physics_process(delta):
	if !game_started:
		return
	move_local_x(-move_speed*delta)
	player_movement(delta)
	count += delta
	flip_counter += delta
	if count > 0.5:
		Global.score += 1
		count = 0

func player_movement(_delta):
	if Input.is_action_pressed("left_input"):
		if flip_counter < flip_gate:
			return
		if facing == -1:
			return
		flip_player()
	if Input.is_action_pressed("right_input"):
		if flip_counter < flip_gate:
			return
		if facing == 1:
			return
		flip_player()
	if Input.is_action_pressed("up_input"):
		if rotation * facing < -1.5:
			flip_player()
		rotate(-facing * turn_speed * _delta)
	if Input.is_action_pressed("down_input"):
		if rotation * facing > 1.5:
			flip_player()
		rotate(facing * turn_speed * _delta)

func _on_area_2d_area_entered(area):
	if area == $Area2D:
		flip_player()

func flip_player():
	scale.x = -scale.x
	facing = -facing
	flip_counter = 0

func _on_game_start_game():
	game_started = true

func _on_game_end_game(cause_of_death):
	game_started = false
	print("Died to: " + cause_of_death)
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
