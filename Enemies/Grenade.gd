extends Node2D

@onready var player = $"../Player"
var positionA
var positionB
var positionC
var has_exploded = false

var t = 0.0
var duration = 2.0

func throw():
	positionA = self.position
	positionB = player.position
	positionC = Vector2(self.position.x, self.position.y - player.position.y)
	await get_tree().create_timer(3).timeout
	explode()

func _physics_process(delta):
	t += delta / duration
	var q0 = positionA.lerp(positionC, min(t, 1.0))
	var q1 = positionC.lerp(positionB, min(t, 1.0))
	position = q0.lerp(q1, min(t, 1.0))

func explode():
	$Sprite2D.hide()
	$AnimationPlayer.play("explode")
	$Boom.play()
	await get_tree().create_timer(0.1).timeout
	has_exploded = true
	await get_tree().create_timer(0.4).timeout
	$Explosion.hide()
	$Explosion/Area2D/CollisionShape2D.set_deferred("disabled", true)
	await get_tree().create_timer(2).timeout
	queue_free()

func _on_area_2d_area_entered(area):
	if !has_exploded:
		return
	if area.get_parent().name == "Guitar" or area.get_parent().name == "Skateboard" or area.get_parent().name == "Player":
		get_parent().game_over("grenade")
