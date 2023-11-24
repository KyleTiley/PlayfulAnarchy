extends Node2D

@onready var player = $"../Player"
var player_position
var target_position
var cop_speed = 50
var shield_broken = false
var knockback_strength = 100

func _physics_process(delta):
	var x_diff = global_position.x - player.global_position.x
	var y_diff = global_position.y - player.global_position.y
	scale.x = 1 * sign(x_diff)
	$Sprite2D.scale.x = 1 * sign(x_diff)
	$Shield.scale.x = 1 * sign(x_diff)
	self.move_local_x(-cop_speed * delta)
	self.move_local_y(sign(y_diff) * -cop_speed * delta)

func _on_area_2d_area_entered(area):
	if area.get_parent().name == "Guitar":
		if !shield_broken:
			shield_break(area)
			return
		self.queue_free()
	if area.get_parent().name == "Skateboard":
		pass
	if area.get_parent().name == "Player":
		get_tree().quit()

func shield_break(_area):
	shield_broken = true
	$Shield.hide()
	var direction = (_area.get_parent().position - self.position).normalized()
	self.move_local_x(direction.x * knockback_strength)
	self.move_local_y(direction.y * knockback_strength)

func knock_back(_area):
	var direction = (_area.get_parent().position - self.position).normalized()
	self.move_local_x(direction.x * knockback_strength)
	self.move_local_y(direction.y * knockback_strength)
