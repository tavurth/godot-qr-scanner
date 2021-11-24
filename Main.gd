extends Control

var CameraSelect = preload("CameraSelect.tscn")
var CameraApp = preload("Camera.tscn")

func _camera_selected(_camera):
	# Remove selector
	self.get_child(0).queue_free()
	
	# Add camera
	self.setup_camera()

func setup_camera():
	self.add_child(CameraApp.instance())

func setup_select():
	var selector = CameraSelect.instance()
	selector.connect("camera_selected", self, "_camera_selected")
	self.add_child(selector)

func _ready():
	self.setup_select()
