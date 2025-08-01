extends PanelContainer


func _on_mouse_entered():
	Popups.ITEMpopup(Rect2i(Vector2i(global_position),Vector2i(size)),null)


func _on_mouse_exited():
	Popups.HideITEMpopup()
