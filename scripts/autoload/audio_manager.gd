extends Node

@onready var _audioQueuesByName :Dictionary  = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is AudioQueue:
			_audioQueuesByName[child.name] = child
	playBackgroundMenuAudio()

func playBackgroundMenuAudio():
	get_audio_queue_by_name("BackgroundAudioQueue").play_audio_with_fade_in(2)

func stopBackgroundMenuAudio():
	get_audio_queue_by_name("BackgroundAudioQueue").stop_audio_with_fade_out(4)
	
func playBackgroundGameAudio():
	get_audio_queue_by_name("BackgroundGameAudioQueue").play_audio_with_fade_in(2)
	
func stopBackgroundGameAudio():
	get_audio_queue_by_name("BackgroundGameAudioQueue").stop_audio_with_fade_out(4)

func playChoiceButtonAudioQueue():
	get_audio_queue_by_name("ChoiceButton").play_audio()

func playFootstepSound():
	pass

func playBoomShutdownSound():
	pass
	
func get_audio_queue_by_name(audio_name: String) -> AudioQueue :
	return _audioQueuesByName[audio_name]
