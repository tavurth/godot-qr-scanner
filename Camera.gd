extends VBoxContainer

signal photo_taken(texture)

func find_active():
	for feed in CameraServer.feeds():
		if feed.is_active():
			return feed
	
	return null

func _on_CaptureButton_pressed():
	var snap = $ViewportContainer/Viewport.get_texture()
	self.emit_signal("photo_taken", snap)
