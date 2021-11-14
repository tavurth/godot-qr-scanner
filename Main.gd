extends Control

var CameraSelect = preload("CameraSelect.tscn")
var CameraApp = preload("Camera.tscn")

func _photo_taken(photo):
	print(photo)

func _camera_selected(camera):
	# Remove selector
	self.get_child(0).queue_free()
	
	# Add camera
	self.setup_camera()

func setup_camera():
	var camera = CameraApp.instance()
	camera.connect("photo_taken", self, "_photo_taken")
	self.add_child(camera)

func setup_select():
	var selector = CameraSelect.instance()
	selector.connect("camera_selected", self, "_camera_selected")
	self.add_child(selector)

func _ready():
	self.setup_select()
