extends Node
# Déclare la fonction qui sera appelée lorsque le bouton est cliqué


  


func _on_button_pressed() -> void:
	pass # Replace with function body.
	get_tree().change_scene_to_file("res://node_2d.tscn")
func _on_area_2d_body_entered(body: RigidBody2D) -> void:
	get_tree().reload_current_scene()
