extends Node2D

@onready var player = $"../Player"
var player_position
var target_position
var cop_speed = 50

func _physics_process(delta):
	var x_diff = global_position.x - player.global_position.x
	var y_diff = global_position.y - player.global_position.y
	scale.x = 1 * sign(x_diff)
	self.move_local_x(-cop_speed * delta)
	self.move_local_y(sign(y_diff) * -cop_speed * delta)

func _on_area_2d_area_entered(area):
	if area.get_parent().name == "Guitar":
		self.queue_free()
	if area.get_parent().name == "Skateboard":
		print("hit board")
	if area.get_parent().name == "Player":
		get_tree().quit()
