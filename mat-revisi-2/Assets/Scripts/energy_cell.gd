extends Area2D

func _ready():
	GameManager.energy_cells_total += 1  # Tambahkan jumlah total energy_cell saat area dimulai

func _on_body_entered(body):
	if body is PlayerController:
		GameManager.energy_cells_collected += 1  # Tambahkan energy_cell yang dikumpulkan
		if GameManager.energy_cells_collected >= GameManager.energy_cells_total:
			GameManager.enable_exit()  # Aktifkan AreaExit jika semua cell telah diambil
		queue_free()  # Hapus energy_cell dari dunia
