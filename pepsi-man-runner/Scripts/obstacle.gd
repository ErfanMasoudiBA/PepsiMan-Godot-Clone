extends Area3D

func _on_body_entered(body):
	# بررسی می‌کنیم چیزی که وارد شده بازیکن است یا نه
	if body.name == "Player":
		print("Game Over!")
		
		# پیدا کردن نود Main و صدا زدن تابع باخت
		# چون Obstacle فرزند RoadTile و RoadTile فرزند LevelGenerator است،
		# دسترسی مستقیم سخت است. از روش زیر استفاده می‌کنیم:
		var main = get_tree().current_scene
		if main.has_method("game_over"):
			main.game_over()
