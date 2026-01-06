extends Node

# متغیرهایی که باید در اینسپکتور مقداردهی شوند
@export var road_tile_scene: PackedScene
@export var player: Node3D

var spawn_z = 0.0     # موقعیت شروع ساخت جاده
var tile_length = 20.0 # طول هر قطعه جاده
var active_tiles = [] # لیستی برای نگه داشتن جاده‌های فعال

func _ready():
	# در شروع بازی، ۱۰ تکه جاده می‌سازیم تا جلو خالی نباشد
	for i in range(10):
		spawn_tile()

func _process(delta):
	# اگر بازیکن وجود نداشت (مثلا باخته بود) کاری نکن
	if not player:
		return
		
	# بررسی فاصله: اگر بازیکن از اولین جاده لیست عبور کرد
	# (چون حرکت به سمت منفی Z است، شرط کمی متفاوت است)
	if active_tiles.size() > 0:
		var first_tile = active_tiles[0]
		if player.position.z < first_tile.position.z - tile_length:
			# جاده قدیمی را حذف کن
			active_tiles.pop_front() # حذف از لیست
			first_tile.queue_free()  # حذف از بازی
			
			# یک جاده جدید در انتها بساز
			spawn_tile()

func spawn_tile():
	var tile = road_tile_scene.instantiate()
	add_child(tile)
	
	# تنظیم موقعیت
	tile.position.z = spawn_z
	
	# موقعیت بعدی را ۲۰ متر جلوتر (به سمت منفی) می‌بریم
	spawn_z -= tile_length
	
	# به لیست اضافه می‌کنیم
	active_tiles.append(tile)
