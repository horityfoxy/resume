extends Node

var updateYear = 0
var saveFile = "user://session.SCode"
var moneispossible = 0

func _ready():
	loadData()
	TranslationServer.set_locale(data.lang)
	if data.image_started == 1:
		get_tree().change_scene("res://Scenes/Pref/LockScreen.tscn")
	else:
		get_tree().change_scene("res://Scenes/ShlashScreen.tscn")

#Словарь с сохранением:
var data = {
	"lang" : "en",
	"username" : "TESTERTEXT",
	"avatar" : "res://Sprite/Avatars/Fish.png",
	"image_started" : 0,
	"money" : 65,
	"water" : 0,
	"hunger" : 0,
	"year" : 0,
	"exploit" : false
}

# Добавление денег
func addmoney(count): # Коунтер монет
	Global.data.money = Global.data.money + count # Добавление деняк в счетчик
# Какая-нибудь покупка 
func buy(money, hunger, water): # Коунтер монет
	if money <= data.money:
		Global.data.money = Global.data.money - money # Вычитание деняк
		Global.data.hunger = Global.data.hunger - hunger # Вычитание голода
		Global.data.water = Global.data.water - water # Добавление жажды
		moneispossible = 1
	else:
		print("Нищенка")
		moneispossible = 0
	if Global.data.hunger < 0:
		Global.data.hunger = 0
	if Global.data.water < 0:
		Global.data.water = 0

#SAVEDUST
func saveData():
	var file = File.new()
	file.open_encrypted_with_pass(saveFile, File.WRITE, "2e3aEa583e67AGFftTFSYADgdusayg73827td762f3d7gfAdgu6t329eh056732f732ed9DS46195")
#	file.open(saveFile, File.WRITE)
	file.store_string(to_json(data))
	file.close()
func loadData():
	var file = File.new()
	if file.file_exists(saveFile):
		file.open_encrypted_with_pass(saveFile, File.READ, "2e3aEa583e67AGFftTFSYADgdusayg73827td762f3d7gfAdgu6t329eh056732f732ed9DS46195")
#		file.open(saveFile, File.READ)
		var parsejs = parse_json(file.get_as_text())
		file.close()
		if typeof(parsejs) == TYPE_DICTIONARY:
			data = parsejs
		else:
			printerr("Corrupted data!")
	else:
		pass
		get_tree().change_scene("res://Scenes/Contract.tscn")

