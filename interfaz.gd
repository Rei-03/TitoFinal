extends CanvasLayer
			#0     #1      #2       #3     #4    #5    #6       #7
@export var Imagen: TextureRect
@export var Anim: AnimationPlayer

@onready var TextoLabel: Label = $TEXTO

enum NPCS {Tito, Nitrato, Azufre, Carbon, Mia, Baron, Maton1, Maton2} 

var current_dialog:Array = []

const Imagenes : Array = [
	'Tito',
	'Nitrato',
	'Azufre',
	'Carbon', 
	'Mia',
	'Baron',
	'Maton1',
	'Maton2'
]
	
const IMAGENES : Dictionary = {
	'Tito'    :   preload ("res://assets/Tito/cabeza.PNG"),
	'Nitrato' :   preload ("res://icon.svg"),
	'Azufre'  :   preload ("res://icon.svg"),
	'Carbon'  :   preload ("res://icon.svg"),
	'Mia'     :   preload ("res://assets/Warrior/Individual Sprite/Edge-Idle/Warrior_Edge-Idle_1.png"),
	'Baron'   :   preload ("res://assets/Individual Sprite/Idle/Bringer-of-Death_Idle_1.png"),
	'Malo1'  :   preload ("res://assets/Light Bandit/Idle/LightBandit_Idle_0.png"),
	'Malo2'  :   preload ("res://assets/Heavy Bandit/Idle/HeavyBandit_Idle_0.png"),
}


var chats : int = 0
 
var npc : int

func _ready():
	var dialogs = get_tree().get_nodes_in_group("DialogArea")
	for dialog in dialogs:
		dialog.connect('start_dialog',_on_dialog_area_start_dialog)
#Funcion mas importante
func poner_TEXTO (TEXTO:String, NPC:String) -> void:
	
	get_tree().paused = true
	$TEXTO.text = TEXTO
	Imagen.texture = IMAGENES[NPC]
	Anim.play("SET_TEXTO")

func _on_dialog_area_start_dialog(path):
	show()
	var dialog_file = FileAccess.open(path,FileAccess.READ)
	var content = dialog_file.get_as_text()
	content = JSON.parse_string(content)
	current_dialog = content.dialogos
	chats = 0
	poner_TEXTO(current_dialog[chats].texto,current_dialog[chats].personaje)
	get_tree().paused = true
	$BOTON.grab_focus()

func _on_boton_pressed():
	if $AnimationPlayer.is_playing():
		$AnimationPlayer.stop()
		TextoLabel.visible_ratio = 1
		return
	
	chats += 1
	if chats < current_dialog.size():
		poner_TEXTO(current_dialog[chats].texto,current_dialog[chats].personaje)
	else:
		get_tree().paused = false
		hide()
		 








