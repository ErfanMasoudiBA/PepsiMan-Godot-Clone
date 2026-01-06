extends Node3D

# دسترسی به نودهای UI
@onready var score_label = $UI/ScoreLabel
@onready var high_score_label = $UI/HighScoreLabel
@onready var game_over_panel = $UI/GameOverPanel
@onready var player = $Player

var score = 0
var high_score = 0
var is_game_over = false

# مسیر فایل ذخیره‌سازی (در پوشه مخصوص کاربر در سیستم عامل ذخیره می‌شود)
const SAVE_PATH = "user://savegame.cfg"

func _ready():
	# وصل کردن دکمه ریستارت
	$UI/GameOverPanel/RestartButton.pressed.connect(restart_game)
	
	# لود کردن بهترین رکورد از فایل
	load_high_score()
	
	# نمایش اولیه
	update_ui()

func _process(delta):
	if is_game_over:
		return
		
	# افزایش امتیاز
	score += 1
	
	# اگر رکورد را شکستیم، های‌اسکور همزمان آپدیت شود
	if score > high_score:
		high_score = score
	
	# به‌روزرسانی متن‌ها
	update_ui()

func update_ui():
	score_label.text = "Score: " + str(score)
	high_score_label.text = "Best: " + str(high_score)

func game_over():
	if is_game_over: return
	is_game_over = true
	
	# ذخیره رکورد جدید (اگر تغییری کرده باشد)
	save_high_score()
	
	game_over_panel.visible = true
	player.set_physics_process(false)

func restart_game():
	get_tree().reload_current_scene()

# --- توابع ذخیره و لود (سیستم PlayerPrefs) ---

func save_high_score():
	var config = ConfigFile.new()
	# مقدار high_score را با کلید "best_score" در بخش "game" ذخیره می‌کنیم
	config.set_value("game", "best_score", high_score)
	config.save(SAVE_PATH)

func load_high_score():
	var config = ConfigFile.new()
	# تلاش برای باز کردن فایل
	var err = config.load(SAVE_PATH)
	
	# اگر فایل با موفقیت باز شد
	if err == OK:
		# مقدار را می‌خوانیم (اگر نبود، پیش‌فرض 0 برمی‌گرداند)
		high_score = config.get_value("game", "best_score", 0)
	else:
		# اگر فایلی نبود (بار اول اجرای بازی)
		high_score = 0
