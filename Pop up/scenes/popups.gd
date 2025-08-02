extends Control

func ITEMpopup(slot: Rect2i, item):
	
	var mouse_pos = get_viewport().get_mouse_position()
	var correction
	var padding = 4 
	
	if mouse_pos.x <= get_viewport_rect().size.x/2:
		correction = Vector2i(slot.size.x + padding,0)
	else:
		correction = -Vector2i(%ITEMpopup.size.x + padding,0)
	
	%ITEMpopup.popup(Rect2i(slot.position + correction,%ITEMpopup.size))
	
func HideITEMpopup():
	%ITEMpopup.hide()


func _on_texture_rect_mouse_entered() -> void:
	pass # Replace with function body.


func _on_texture_rect_mouse_exited() -> void:
	pass # Replace with function body.
