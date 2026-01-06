extends CharacterBody3D

const FORWARD_SPEED = 10.0  # سرعت حرکت رو به جلو
const LANE_DISTANCE = 3.0   # فاصله بین لاین‌ها
const LERP_SPEED = 10.0     # سرعت نرم جابجایی بین لاین‌ها

# 0 = وسط، -1 = چپ، 1 = راست
var current_lane = 0 
var target_x = 0.0

func _ready():
	# تنظیم لاین اولیه
	target_x = 0.0

func _physics_process(delta):
	# 1. مدیریت ورودی برای تغییر لاین
	if Input.is_action_just_pressed("ui_left"):
		if current_lane > -1:
			current_lane -= 1
	
	if Input.is_action_just_pressed("ui_right"):
		if current_lane < 1:
			current_lane += 1
			
	# محاسبه موقعیت هدف در محور X بر اساس لاین انتخاب شده
	target_x = current_lane * LANE_DISTANCE
	
	# 2. حرکت خودکار رو به جلو (در گودوت منفی Z یعنی جلو)
	velocity.z = -FORWARD_SPEED
	
	# 3. حرکت نرم به سمت لاین هدف (Interpolation)
	velocity.x = (target_x - position.x) * LERP_SPEED
	
	# اعمال حرکت
	move_and_slide()
