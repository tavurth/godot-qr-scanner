extends Button

var camera: CameraFeed

func setup(camera: CameraFeed):
	self.camera = camera
	self.set_text(camera.get_name())

func _on_Camera_pressed():
	CameraServer.add_feed(self.camera)
	self.camera.set_active(true)
