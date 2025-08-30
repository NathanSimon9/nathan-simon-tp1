extends CharacterBody2D

var speed = 300

# Vitesse de saut

var jump_velocity = -450

# Lie les nœuds du jeu au script

@onready var player_sprite = $CharacterRobotSheetHd

@onready var animation_player = $CharacterRobotSheetHd/AnimationPlayer

@export var push_force = 1000.0

# Gère la gravité

func _physics_process(delta):

	# Si le joueur n'est pas au sol, applique la gravité

	if  !is_on_floor():

		velocity.y += 1500 * delta

	# Gère le saut si on appuie sur 'W' et que le joueur est au sol

	if Input.is_action_just_pressed("sauter_2") and is_on_floor():

		velocity.y = jump_velocity
		
		$"AudioStreamPlayer2D/Ytmp3Free_ccCartoon-jump-sound-effect-youtubemp3Free_org".play()

		animation_player.play("sauter")

	# Gère le déplacement horizontal

	var direction = Input.get_axis("reculer_2", "avancer_2")

	# Vérifie si le joueur appuie sur 'a' ou 'd'

	if direction:

		velocity.x = direction * speed
		

		# Si le joueur va vers la droite, il joue l'animation et ne retourne pas le sprite

		if direction > 0:

			animation_player.play("avancer_arriere")


		# Si le joueur va vers la gauche, il retourne le sprite et joue l'animation

		elif direction < 0:

			animation_player.play("avancer_avant") # Réutilise la même animation


	# Si le joueur ne bouge pas horizontalement

	else:

		velocity.x = move_toward(velocity.x, 0, speed)

		# Joue l'animation de repos (si vous en avez une)

		if is_on_floor():

			$CharacterRobotSheetHd/AnimationPlayer.stop() # Arrête l'animation s'il est au sol et ne bouge pas

	move_and_slide()

		# ... (ton code précédent)

	move_and_slide()

	# AJOUT POUR LA COLLISION AVEC LE BALLON

	for i in range(get_slide_collision_count()):

		var collision = get_slide_collision(i)

		if collision.get_collider() is RigidBody2D:

			var rigid_body = collision.get_collider()

			var push_direction = -collision.get_normal()

			# Corrige l'indentation de cette ligne :

			rigid_body.apply_central_impulse(push_direction * push_force)
			velocity.y = -jump_velocity * 1
			  # Ajuste ce facteur pour un meilleur effet
