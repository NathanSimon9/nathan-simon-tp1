extends Node


func _on_area_2d_body_entered(body:Node2D) -> void:
	pass # Replace with function body.
	
	print("but_robot")
	MonJeu.ajouter_bout_j2()
	$robot_score.text = str(MonJeu.buts_j2)
		
	if MonJeu.buts_j2 > 6:
		get_tree().change_scene_to_file("res://scene_ouverture.tscn")
	#get_tree().reload_current_scene()

func _on_body_entered(body: Node) -> void:
	pass # Replace with function body.
	


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	pass # Replace with function body.
	print("but_zombie")
	MonJeu.ajouter_bout_j1()
	$zombie_score.text = str(MonJeu.buts_j1)
		
	if MonJeu.buts_j1 > 6:
		get_tree().change_scene_to_file("res://scene_ouverture.tscn")
