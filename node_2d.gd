extends CharacterBody2D

# Vitesse de déplacement du joueur

var speed = 300

# Vitesse de saut

var jump_velocity = -450

# Lie les nœuds du jeu au script

@onready var player_sprite = $PlayerSprite

@onready var animation_player = $AnimationPlayer

# Gère la gravité

func _physics_process(delta):

	# Si le joueur n'est pas au sol, applique la gravité

	if not is_on_floor():

		velocity.y += 980 * delta

	# Gère le saut si on appuie sur 'W' et que le joueur est au sol

	if Input.is_action_just_pressed("ui_up") and is_on_floor():

		velocity.y = jump_velocity

		animation_player.play("sauter")

	# Gère le déplacement horizontal

	var direction = Input.get_axis("ui_left", "ui_right")

	# Vérifie si le joueur appuie sur 'a' ou 'd'

	if direction:

		velocity.x = direction * speed

		# Si le joueur va vers la droite, il joue l'animation et ne retourne pas le sprite

		if direction > 0:

			animation_player.play("avancer devant")

			player_sprite.flip_h = false

		# Si le joueur va vers la gauche, il retourne le sprite et joue l'animation

		elif direction < 0:

			animation_player.play("avancer_droit") # Réutilise la même animation

			player_sprite.flip_h = true

	# Si le joueur ne bouge pas horizontalement

	else:

		velocity.x = move_toward(velocity.x, 0, speed)

		# Joue l'animation de repos (si vous en avez une)

		if is_on_floor():

			animation_player.stop() # Arrête l'animation s'il est au sol et ne bouge pas

	move_and_slide()
