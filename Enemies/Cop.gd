extends Node2D

@onready var player = $"../Player"
var player_position
var target_position
var cop_speed = 50
var knockback_strength = 0.5

func _physics_process(delta):
	var x_diff = global_position.x - player.global_position.x
	var y_diff = global_position.y - player.global_position.y
	scale.x = 1 * sign(x_diff)
	$Sprite2D.scale.x = 1 * sign(x_diff)
	self.move_local_x(-cop_speed * delta)
	self.move_local_y(sign(y_diff) * -cop_speed * delta)

func _on_area_2d_area_entered(area):
	if area.get_parent().name == "Guitar":
		knock_back(area)
		$Area2D/CollisionShape2D.set_deferred("disabled", true)
		Game.score += 10
		await get_tree().create_timer(0.3).timeout
		self.queue_free()
	if area.get_parent().name == "Skateboard":
		pass
	if area.get_parent().name == "Player":
		Game.game_over("cop")

func knock_back(_area):
	var direction = (self.global_position - _area.get_parent().global_position)
	$AnimationPlayer.play("white_hit")
	self.move_local_x(direction.x * knockback_strength)
	self.move_local_y(direction.y * knockback_strength)
