extends TextureRect

@onready var popups = $"../Popups"  # อ้างถึง Popups ที่เป็นพี่น้องกัน

func _on_mouse_entered():
	var slot_rect = Rect2i(Vector2i(global_position), Vector2i(size))
	popups.ITEMpopup(slot_rect, null)

func _on_mouse_exited():
	popups.HideITEMpopup()

# ----- Drag & Drop -----
func _get_drag_data(at_position):
	if texture == null:
		return null
	
	var preview_texture = TextureRect.new()
	
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(70, 70)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	
	return preview_texture.texture

func _can_drop_data(_pos, data):
	return data is Texture2D

func _drop_data(_pos, data):
	texture = data 
