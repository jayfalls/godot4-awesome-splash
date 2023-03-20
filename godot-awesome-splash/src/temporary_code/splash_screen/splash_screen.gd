extends AweSplashScreen

@onready var logo_container: Node2D = $AspectNode/LogoContainer
@onready var logo: TextureRect = $AspectNode/LogoContainer/Logo

@onready var info_node: AweTextNode = $AspectNode/InfoNode
@onready var title_node: AweListTextNode = $AspectNode/TitleNode
@onready var bg_color: ColorRect = $CanvasLayer/ColorRect


const LOGO_PATH: String = "res://src/demo_collection/temp/logo.png"
const TITLE: String = "GODOT"
const DESCRIPTION: String = "Game engine"


const BG_COLOR: Color = Color8(0, 0, 0, 255)
const LOGO_COLOR: Color = Color8(255, 255, 255, 255)
const TITLE_COLOR: Color = Color8(255, 255, 255, 255)
const DESCRIPTION_COLOR: Color = Color8(255, 255, 255, 255)

const TITLE_FONT_SIZE: int = 230
const DESCRIPT_FONT_SIZE: int = 120


func get_name() -> StringName:
	return "Temp"


func play():
	config()
	main_animation()


func config():
	bg_color.color = BG_COLOR
	logo.texture = load_texture(LOGO_PATH)
	logo.modulate = LOGO_COLOR
	
	var center_point = self.origin_size / 2.0
	logo_container.modulate = LOGO_COLOR
	logo_container.position = center_point + Vector2(0, -100)
	logo_container.scale = Vector2(0.8, 0.8)
	
	# Config TitleNode
	title_node.font.size = TITLE_FONT_SIZE
	title_node.modulate = TITLE_COLOR
	title_node.text = TITLE
	title_node.position = center_point + Vector2(0, 50)

	
	# Config InfoNode
	info_node.font.size = DESCRIPT_FONT_SIZE
	info_node.modulate = DESCRIPTION_COLOR
	info_node.text = DESCRIPTION
	info_node.position = center_point + Vector2(0, 225)



func main_animation():
	pass



func logo_size():
	return 300.0
