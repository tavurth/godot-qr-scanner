extends Button

var camera: CameraFeed

func setup(new_camera: CameraFeed):
	self.camera = new_camera
	self.set_text(new_camera.get_name())

func _on_Camera_pressed():
	CameraServer.add_feed(self.camera)
	self.camera.set_active(true)
