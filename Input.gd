extends Control
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	JavaScriptBridge.eval("console.log(window.location.search")
	if Input.is_action_just_pressed("switch"):
		$StartingSoon.visible = !$StartingSoon.visible
		$BeRightBack.visible = !$BeRightBack.visible
