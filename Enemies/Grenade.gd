extends Node2D

@onready var player = $"../Player"
var positionA
var positionB
var positionC

var t = 0.0
var duration = 3.0

func throw():
	positionA = self.position
	print(self.name)
	positionB = player.position
	positionC = Vector2(self.position.x, player.position.y)
	await get_tree().create_timer(4).timeout
	print("EXPLODE")

func _process(delta):
	t += delta / duration
	var q0 = positionA.lerp(positionC, min(t, 1.0))
	var q1 = positionC.lerp(positionB, min(t, 1.0))
	position = q0.lerp(q1, min(t, 1.0))
