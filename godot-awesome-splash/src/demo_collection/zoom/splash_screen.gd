extends AweSplashScreenViewport

@onready var logo_container := $SubViewportContainer/SubViewport/AspectNode/LogoContainer
@onready var logo := $SubViewportContainer/SubViewport/AspectNode/LogoContainer/Logo

@onready var info_node := $SubViewportContainer/SubViewport/AspectNode/InfoNode
@onready var title_node := $SubViewportContainer/SubViewport/AspectNode/TitleNode
@onready var bg_color := $CanvasLayer/ColorRect

@export var logo_path = "res://src/demo_collection/zoom/src/logo.png" # (String, FILE)
@export var title: String := "GODOT"
@export var description: String := "Game engine"

@export (float) var duration := 2.0
@export (Color) var background_color := Color.BLACK

@export (Color) var logo_color :=  Color8(255, 255, 255, 255)
@export (Color) var font_color := Color.WHITE
@export (float) var title_font_size := 230.0
@export (float) var description_font_size := 120.0


var time_appear: float
var time_zoom: float

const MIN_ZOOM = 1.0
const MAX_ZOOM = 1.1


func get_name() -> String:
	return "Zoom"

func _ready():
	super._ready()


func config():
	time_appear = duration / 3.0
	time_zoom = duration
	
	_set_shader_f_value("process_value", 0.0)
	_set_shader_f_value("fade", 0.0)
	_set_shader_f_value("min_zoom", MIN_ZOOM)
	_set_shader_f_value("max_zoom", MAX_ZOOM)
	bg_color.color = background_color
	logo.texture = load_texture(logo_path)
	logo.modulate = logo_color
	
	var center_point = self.origin_size / 2.0
	logo_container.modulate = logo_color
	logo_container.position = center_point + Vector2(0, -100)
	logo_container.scale = Vector2(0.8, 0.8)
	
	# Config TitleNode
	title_node.font.size = title_font_size
	title_node.modulate = font_color
	title_node.text = title
	title_node.position = center_point + Vector2(0, 50)

	
	# Config InfoNode
	info_node.font.size = description_font_size
	info_node.modulate = font_color
	info_node.text = description
	info_node.position = center_point + Vector2(0, 225)


func play():
	config()
	main_animation()


func main_animation():
	gd.sequence([
		gd.group([
			gd.custom_action("update_appear", self, time_appear),
			gd.custom_action("update_zoom", self, time_zoom),
		]),
		gd.perform("finished_animation", self)
	])\
	super.start(self)


func update_appear(_value: float, eased_value: float, _delta: float):
	_set_shader_f_value("fade", eased_value)

func update_zoom(_value: float, eased_value: float, _delta: float):
	_set_shader_f_value("process_value", eased_value)
