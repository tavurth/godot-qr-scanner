extends Control

signal camera_selected(camera)

var FeedSelect = preload("CameraItem.tscn")

func _on_new_camera(camera_id: int):
	self.emit_signal("camera_selected", CameraServer.get_feed(camera_id))

func make_camera(camera: CameraFeed):
	var to_return = FeedSelect.instance()
	to_return.setup(camera)
	return to_return

func setup():
	# Find all our possible cameras
	var feeds = CameraServer.feeds()

	print("Found cameras", feeds)
	
	# We did not find any cameras to process
	# Show an error instead
	if not len(feeds):
		return $NoCamerasFound.show()
	
	# Loop through each camera and add them as a button
	for camera in feeds:
		$CamerasContainer/Cameras.add_child(self.make_camera(camera))
	
func _ready():
	var _e = CameraServer.connect("camera_feed_added", self, "_on_new_camera")
	self.setup()
