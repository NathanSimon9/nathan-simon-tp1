extends RigidBody2D

@onready var sound_bounce = $AudioStreamPlayer2D/FootstepGrass002
func _on_body_entered(body):

	if body is StaticBody2D:
		sound_bounce.play()
		


func _on_area_2d_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
