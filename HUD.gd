extends CanvasLayer

signal start_game

func show_message(text):
    $MessageLabel.text = text
    $MessageLabel.show()
    $MessageTimer.start()

func _ready():
    $StartButton.connect("pressed", self, "_on_StartButton_pressed")
    $SettingsButton.connect("pressed", self, "_on_SettingsButton_pressed")
    $BackButton.connect("pressed", self, "_on_BackButton_pressed")
    $MessageTimer.connect("timeout", self, "_on_MessageTimer_timeout")

func show_game_over():
    show_message("Game Over")
    yield($MessageTimer, "timeout")
    $ScoreLabel.hide()
    $MessageLabel.text = "Dodge the\nCreeps!"
    $MessageLabel.show()
    yield(get_tree().create_timer(1), "timeout")
    $StartButton.show()
    $SettingsButton.show()

func update_score(score):
    $ScoreLabel.text = str(score)

func _on_StartButton_pressed():
    $StartButton.hide()
    $SettingsButton.hide()
    $ScoreLabel.show()
    emit_signal("start_game")

func _on_SettingsButton_pressed():
    $SettingsButton.hide()
    $MessageLabel.hide()
    $StartButton.hide()
    $EasyButton.show()
    $MedButton.show()
    $HardButton.show()
    $BackButton.show()

func _on_BackButton_pressed():
    $EasyButton.hide()
    $MedButton.hide()
    $HardButton.hide()
    $BackButton.hide()
    $SettingsButton.show()
    $MessageLabel.show()
    $StartButton.show()

func _on_MessageTimer_timeout():
    $MessageLabel.hide()
