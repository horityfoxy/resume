# Закрытие игры при нажатии на ESC. В настройках проекта в "ui_cancel" прописана клавиша ESC.

extends Node3D

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit() # Quits the game
