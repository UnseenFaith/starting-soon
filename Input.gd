extends Control

var minutes = 10;
var seconds = 0;

var message = "[wave amp=50.0 freq=3.0 connected=1]{minutes}:{seconds}[/wave]"

func _ready() -> void:
	var web_hash = JavaScriptBridge.eval("window.location.hash")
	if web_hash:
		var replaced_text = web_hash.replace("#", "").replace("%20", " ")
		var text1 = replaced_text.split(";")[0]
		var text2 = replaced_text.split(";")[1]
		$TextLabel.text = $TextLabel.text.replace("{text1}", text1).replace("{text2}", text2)
	
	$TextLabel2.text = $TextLabel2.text.replace("{minutes}", str(minutes)).replace("{seconds}", str(seconds) + "0")

func _on_timer_timeout():
	if minutes == 0 && seconds == 0:
		$Timer.stop()
		$TextLabel2.visible = false
		return
	
	var strSeconds = ""
	
	if seconds == 0:
		minutes = minutes - 1
		seconds = 59
		strSeconds = 59
	else:
		seconds = seconds - 1
		if seconds < 10:
			strSeconds = "0" + str(seconds)
		else:
			strSeconds = str(seconds)
	
	$TextLabel2.text = message.replace("{minutes}", str(minutes)).replace("{seconds}", str(strSeconds))
