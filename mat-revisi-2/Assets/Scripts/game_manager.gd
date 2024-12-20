extends Node

var starting_area = 1
# Import kelas AreaExit dari lokasi skripnya
const AreaExit = preload("res://Assets/Scripts/area_exit.gd")  # Ganti dengan path sebenarnya

var current_area = 1
var area_path = "res://Assets/Scenes/Areas/"
var energy_cells_total = 0  # Total energy_cell di area saat ini
var energy_cells_collected = 0  # Energy_cell yang sudah dikumpulkan

@onready var area_exit: AreaExit = null  # Referensi ke AreaExit

func next_level():
	current_area += 1
	energy_cells_total = 0  # Reset jumlah total energy_cell
	energy_cells_collected = 0  # Reset energy_cell yang dikumpulkan
	var full_path = area_path + "area_" + str(current_area) + ".tscn"
	get_tree().change_scene_to_file(full_path)
	print("The player has moved to area " + str(current_area))

func enable_exit():
	if area_exit:
		area_exit.open()  # Aktifkan AreaExit

func set_exit(exit_node: AreaExit):
	area_exit = exit_node  # Simpan referensi ke AreaExit
