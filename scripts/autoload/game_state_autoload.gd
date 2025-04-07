extends Node

var data = {
	"max_score":0,
	"want_to_sleep":false,
	"level":null,
	"level_name":"undefined"
}

func _init() -> void:
	load_game()
	
func save_game():
		var save_file = FileAccess.open("user://savegame.save", FileAccess.WRITE)
		var json_string = JSON.stringify(data)
		save_file.store_line(json_string)
		save_file.close()
		
func load_game():
	if not FileAccess.file_exists("user://savegame.save"):
		return # Error! We don't have a save to load.
	var file = FileAccess.open("user://savegame.save", FileAccess.READ)
	var json  = file.get_as_text()
	var saved_data = JSON.parse_string(json)
	
	if saved_data && saved_data.has("max_score") :
		data.max_score = saved_data.max_score
		
