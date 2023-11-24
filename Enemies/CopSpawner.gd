extends Node2D

var spawn_locations = []
var spawn_time = 3
var time_count = spawn_time
var spawn_count = 0
var cop = load("res://Enemies/cop.tscn")
var riot_cop = load("res://Enemies/riotcop.tscn")

func _ready():
	for child in self.get_children():
		spawn_locations.append(child)

func _physics_process(delta):
	time_count += delta
	if time_count > spawn_time:
		time_count = 0
		spawn_count += 1
		var new_rand = random_number_generator(0, 100)
		var new_cop
		if new_rand < 80:
			new_cop = cop.instantiate()
		else:
			new_cop = cop.instantiate()
		get_parent().add_child(new_cop)
		new_cop.position = spawn_locations[random_number_generator(0, spawn_locations.size())].position

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number
