extends RigidBody2D

@onready var sound_bounce = $AudioStreamPlayer2D/FootstepGrass002
func _on_body_entered(body):

	if body is StaticBody2D:
		sound_bounce.play()
