extends CharacterBody2D

func _ready(): # Se activa al inicio de la escena
	$Animations.play("knight_idle")

# Se activa cada frame físico (constantemente)
func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if direction.x == 1: 
		$Idle.visible = false
		$Run.visible = true
		$Run.flip_h = false
		$Idle.flip_h = false
		$Animations.play("kight_run")
	elif direction.x == -1:
		$Idle.visible = false
		$Run.visible = true
		$Run.flip_h = true
		$Idle.flip_h = true
		$Animations.play("kight_run")
	else: 
		$Idle.visible = true
		$Run.visible = false
		$Animations.play("knight_idle")
	
	direction.y = 0
	
	velocity = direction * 200
	move_and_slide()
