extends Node2D

var spawn_locations = []
var spawn_time = 3
var time_count = spawn_time
var grenade = load("res://Enemies/grenade.tscn")

func _ready():
	for child in self.get_children():
		spawn_locations.append(child)

func _physics_process(delta):
	time_count += delta
	if time_count > spawn_time:
		time_count = 0
		var new_grenade = grenade.instantiate()
		get_parent().add_child(new_grenade)
		new_grenade.position = spawn_locations[random_number_generator(0, spawn_locations.size())].position
		new_grenade.throw()

func random_number_generator(_min, _max):
	var rng = RandomNumberGenerator.new()
	var new_random_number = rng.randf_range(_min, _max)
	return new_random_number
