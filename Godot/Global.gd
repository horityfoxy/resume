# код сохранения прогресса игры, когда вызывается функция глобального скрипта saveData()
extends Node

var saveFile = "user://session.SCode" # файл сохранения

func _ready():
	loadData() # загрузка данных сохранения
	TranslationServer.set_locale(data.lang) # установка языка
	if data.image_started == 1: # выбор сцены в зависимости от сохранения
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

#SAVEDUST
func saveData(): # запись данных в файл сохранения 
	var file = File.new()
	file.open_encrypted_with_pass(saveFile, File.WRITE, "2e3aEa583e67AGFftTFSYADgdusayg73827td762f3d7gfAdgu6t329eh056732f732ed9DS46195")
	file.store_string(to_json(data))
	file.close()

func loadData(): # загрузка данных. Если нет файла сохранения, то начать игру сначала
	var file = File.new()
	if file.file_exists(saveFile): # все сохранения защищены паролем и зашифрованы
		file.open_encrypted_with_pass(saveFile, File.READ, "2e3aEa583e67AGFftTFSYADgdusayg73827td762f3d7gfAdgu6t329eh056732f732ed9DS46195")
		var parsejs = parse_json(file.get_as_text()) # сохранения используют JSON
		file.close()
		if typeof(parsejs) == TYPE_DICTIONARY:
			data = parsejs
		else:
			printerr("Corrupted data!") # сообщение об ошибке 
	else:
		pass
		get_tree().change_scene("res://Scenes/Contract.tscn")

