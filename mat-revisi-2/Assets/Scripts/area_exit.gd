extends Area2D
class_name AreaExit

@export var sprite: Sprite2D
var is_open = false

@onready var animation_player = $AnimationPlayer

func _ready() -> void:
	close()
	GameManager.set_exit(self)  # Daftarkan diri ke GameManager

func open():
	is_open = true
	animation_player.play("flag")  # Animasi tetap berjalan
	print("AreaExit is now open.")

func close():
	is_open = false
	animation_player.play("flag")  # Animasi tetap berjalan meskipun pintu tertutup
	print("AreaExit is closed.")

func _on_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if is_open and body is PlayerController:
		GameManager.next_level()
