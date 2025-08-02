extends TextureRect

func _get_drag_data(at_position): #trigger when click and drag
	var preview_texture =TextureRect.new()
	preview_texture.texture = texture
	preview_texture.expand_mode = 1
	preview_texture.size = Vector2(70,70)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	texture = null
	return preview_texture.texture

func _can_drop_data(_pos,data): #tigger when hover with dragged item
	return data is Texture2D
	
func _drop_data(_pos,data): #trigger when drop that dragged item
	texture = data
	
