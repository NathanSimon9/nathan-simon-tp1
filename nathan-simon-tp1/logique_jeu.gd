extends Node
var buts_j1 = 0
var buts_j2 = 0

func ajouter_bout_j1():
	buts_j1 += 1
	print("j1: ", buts_j1)
	
func ajouter_bout_j2():
	buts_j2 += 1
	print("j2: ", buts_j2)
	
func _on_area_2d_body_entered(_body) -> void:
	pass # Replace with function body.
	
	print("but_robot")
	ajouter_bout_j2()
	$AudioStreamPlayer2D2.play()
	$robot_score.text = str(buts_j2)
		
	if buts_j2 > 6:
		get_tree().change_scene_to_file("res://robot_gagner.tscn")


func _on_area_2d_2_body_entered(_body) -> void:
	pass # Replace with function body.
	print("but_zombie")
	ajouter_bout_j1()
	$AudioStreamPlayer2D2.play()
	$zombie_score.text = str(buts_j1)
	
	if buts_j1 > 6:
		get_tree().change_scene_to_file("res://zombie_gagner.tscn")


func _on_rigid_body_2d_body_entered(body) -> void:
	pass # Replace with function body.
	if body is StaticBody2D:
		$RigidBody2D/AudioStreamPlayer2D.play()
