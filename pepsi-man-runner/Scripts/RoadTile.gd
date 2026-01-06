extends Node3D

# بارگذاری صحنه مانع
var obstacle_scene = preload("res://Scenes/Obstacle.tscn")

func _ready():
	spawn_obstacle()

func spawn_obstacle():
	# یک عدد تصادفی بین 0 تا 2 انتخاب می‌کنیم (برای 3 لاین)
	# لاین‌ها: -1 (چپ)، 0 (وسط)، 1 (راست)
	var random_index = randi() % 3  # نتیجه میشه 0 یا 1 یا 2
	var lane = random_index - 1     # تبدیل میشه به -1 یا 0 یا 1
	
	# ساخت نمونه از مانع
	var obstacle = obstacle_scene.instantiate()
	add_child(obstacle)
	
	# تنظیم موقعیت مانع
	# X: بر اساس لاین (فاصله 3 متر)
	# Y: کمی بالاتر از زمین (مثلا 0.5)
	# Z: در یک جای تصادفی روی طول جاده (مثلا بین -5 تا -15)
	var random_z = randf_range(-5.0, -15.0)
	obstacle.position = Vector3(lane * 3.0, 0.5, random_z)
