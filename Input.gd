extends Control

func _ready() -> void:
	var web_hash = JavaScriptBridge.eval("window.location.hash")
	if web_hash:
		var replaced_text = web_hash.replace("#", "")
		var text1 = replaced_text.split(";")[0]
		var text2 = replaced_text.split(";")[1]
		$TextLabel.text = $TextLabel.text.replace("{text1}", text1).replace("{text2}", text2)
		
