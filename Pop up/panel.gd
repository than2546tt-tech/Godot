extends PanelContainer

@onready var tex_rect: TextureRect = $TextureRect

func _ready():
	# ให้ PanelContainer ไม่ดัก event เมาส์ (ส่งต่อให้ TextureRect)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	tex_rect.mouse_filter = Control.MOUSE_FILTER_STOP

# ---------- POPUP ----------
func _on_mouse_entered():
	Popups.ITEMpopup(Rect2i(Vector2i(global_position), Vector2i(size)), null)

func _on_mouse_exited():
	Popups.HideITEMpopup()

# ---------- DRAG ----------
func _get_drag_data(at_position):
	if tex_rect.texture == null:
		return null  # ไม่มี texture ก็ไม่ให้ลาก
	
	var preview_texture = TextureRect.new()
	preview_texture.texture = tex_rect.texture
	preview_texture.expand_mode = TextureRect.EXPAND_FIT_WIDTH
	preview_texture.size = Vector2(70, 70)
	
	var preview = Control.new()
	preview.add_child(preview_texture)
	
	set_drag_preview(preview)
	return tex_rect.texture  # ส่ง texture ออกไป

func _can_drop_data(_pos, data):
	return data is Texture2D  # รองรับ drop กลับมาที่ตัวเอง

func _drop_data(_pos, data):
	tex_rect.texture = data  # เซ็ต texture ใหม่
