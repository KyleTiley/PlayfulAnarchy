extends Node2D

var spawn_locations = []
var spawn_time = 3
var time_count = spawn_time
var spawn_count = 0
var cop = load("res://Enemies/cop.tscn")
var riot_cop = load("res://Enemies/riotcop.tscn")
var game_started = false

func _ready():
	for child in self.get_children():
		spawn_locations.append(child)

func _physics_process(delta):
	if !game_started:
		return
	time_count += delta
	if time_count > spawn_time:
		time_count = 0
		spawn_count += 1
		var new_rand = random_number_generator(0, 100)
		var new_cop
		if new_rand < 70:
			new_cop = cop.instantiate()
		else:
			new_cop = riot_cop.instantiate()
		get_parent().add_child(new_cop)
		new_cop.position = spawn_locations[random_number_generator(0, spawn_locations.size())].position

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number

func _on_game_start_game():
	game_started = true

func _on_game_end_game(cause_of_death):
	game_started = false
	print(cause_of_death + " freed")
