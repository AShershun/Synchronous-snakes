extends Node

const BLUE_SNAKE = 2
const YELLOW_APPLE = 5
const BLUE_APPLE = 4
const YELLOW_SNAKE = 7
var apple_pos
var blue_snake_body = [Vector2(5,9),Vector2(4,9),Vector2(3,9)]
var blue_snake_direction = Vector2(1,0)
var yellow_snake_body = [Vector2(14,10),Vector2(15,10),Vector2(16,10)]
var yellow_snake_direction = Vector2(-1,0)
var add_apple = false
var apple = true

func _ready():
	apple_pos = place_apple()

	
func place_apple():
	randomize()
	var x = randi() % 20
	var y = randi() % 20
	return Vector2(x,y)

func draw_apple():
	if (apple):
		$SnakeApple.set_cell(apple_pos.x,apple_pos.y,YELLOW_APPLE)
	else:
		$SnakeApple.set_cell(apple_pos.x,apple_pos.y,BLUE_APPLE)

func draw_snake():
#	blue snake

	for blue_block_index in blue_snake_body.size():
		var blue_block = blue_snake_body[blue_block_index]
		
		if blue_block_index == 0:
			var head_dir = relation2(blue_snake_body[0],blue_snake_body[1])
			if head_dir == 'right': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,true,false,false,Vector2(2,0))
			if head_dir == 'left': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(2,0))
			if head_dir == 'top': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(3,0))
			if head_dir == 'bottom': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,true,false,Vector2(3,0))
		elif blue_block_index == blue_snake_body.size() - 1:
			var tail_dir = relation2(blue_snake_body[-1],blue_snake_body[-2])
			if tail_dir == 'right': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(0,0))
			if tail_dir == 'left': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,true,false,false,Vector2(0,0))
			if tail_dir == 'top': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,true,false,Vector2(0,1))
			if tail_dir == 'bottom': 
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(0,1))
		
		else:
			var blue_previous_block = blue_snake_body[blue_block_index + 1] - blue_block
			var blue_next_block = blue_snake_body[blue_block_index - 1] - blue_block
			
			if blue_previous_block.x == blue_next_block.x:
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(4,1))
			elif blue_previous_block.y == blue_next_block.y:
				$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(4,0))
			else:
				if blue_previous_block.x == -1 and blue_next_block.y == -1 or blue_next_block.x == -1 and blue_previous_block.y == -1:
					$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,true,true,false,Vector2(5,0))
				if blue_previous_block.x == -1 and blue_next_block.y == 1 or blue_next_block.x == -1 and blue_previous_block.y == 1:
					$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,true,false,false,Vector2(5,0))
				if blue_previous_block.x == 1 and blue_next_block.y == -1 or blue_next_block.x == 1 and blue_previous_block.y == -1:
					$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,true,false,Vector2(5,0))
				if blue_previous_block.x == 1 and blue_next_block.y == 1 or blue_next_block.x == 1 and blue_previous_block.y == 1:
					$SnakeApple.set_cell(blue_block.x,blue_block.y,BLUE_SNAKE,false,false,false,Vector2(5,0))
		
		for yellow_block_index in yellow_snake_body.size():
			var yellow_block = yellow_snake_body[yellow_block_index]
			
			if yellow_block_index == 0:
				var head_dir = relation2(yellow_snake_body[0],yellow_snake_body[1])
				if head_dir == 'right': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,true,false,false,Vector2(2,0))
				if head_dir == 'left': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(2,0))
				if head_dir == 'top': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(3,0))
				if head_dir == 'bottom': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,true,false,Vector2(3,0))
			elif yellow_block_index == yellow_snake_body.size() - 1:
				var tail_dir = relation2(yellow_snake_body[-1],yellow_snake_body[-2])
				if tail_dir == 'right': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(0,0))
				if tail_dir == 'left': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,true,false,false,Vector2(0,0))
				if tail_dir == 'top': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,true,false,Vector2(0,1))
				if tail_dir == 'bottom': 
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(0,1))
			
			else:
				var yellow_previous_block = yellow_snake_body[yellow_block_index + 1] - yellow_block
				var yellow_next_block = yellow_snake_body[yellow_block_index - 1] - yellow_block
				
				if yellow_previous_block.x == yellow_next_block.x:
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(4,1))
				elif yellow_previous_block.y == yellow_next_block.y:
					$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(4,0))
				else:
					if yellow_previous_block.x == -1 and yellow_next_block.y == -1 or yellow_next_block.x == -1 and yellow_previous_block.y == -1:
						$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,true,true,false,Vector2(5,0))
					if yellow_previous_block.x == -1 and yellow_next_block.y == 1 or yellow_next_block.x == -1 and yellow_previous_block.y == 1:
						$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,true,false,false,Vector2(5,0))
					if yellow_previous_block.x == 1 and yellow_next_block.y == -1 or yellow_next_block.x == 1 and yellow_previous_block.y == -1:
						$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,true,false,Vector2(5,0))
					if yellow_previous_block.x == 1 and yellow_next_block.y == 1 or yellow_next_block.x == 1 and yellow_previous_block.y == 1:
						$SnakeApple.set_cell(yellow_block.x,yellow_block.y,YELLOW_SNAKE,false,false,false,Vector2(5,0))

func relation2(first_block:Vector2,second_block:Vector2):
	var block_relation = second_block - first_block
	if block_relation == Vector2(-1,0): return 'left'
	if block_relation == Vector2(1,0): return 'right'
	if block_relation == Vector2(0,1): return 'bottom'
	if block_relation == Vector2(0,-1): return 'top'
	

func move_snake():
	if add_apple:
		delete_tiles(BLUE_SNAKE)
		delete_tiles(YELLOW_SNAKE)
		var blue_body_copy = blue_snake_body.slice(0,blue_snake_body.size() - 1)
		var blue_new_head = blue_body_copy[0] + blue_snake_direction
		var yellow_body_copy = yellow_snake_body.slice(0,yellow_snake_body.size() - 1)
		var yellow_new_head = yellow_body_copy[0] + yellow_snake_direction
		blue_body_copy.insert(0,blue_new_head)
		blue_snake_body = blue_body_copy
		yellow_body_copy.insert(0,yellow_new_head)
		yellow_snake_body = yellow_body_copy
		add_apple = false
	else:
		delete_tiles(BLUE_SNAKE)
		delete_tiles(YELLOW_SNAKE)
		var blue_body_copy = blue_snake_body.slice(0,blue_snake_body.size() - 2)
		var blue_new_head = blue_body_copy[0] + blue_snake_direction
		var yellow_body_copy = yellow_snake_body.slice(0,yellow_snake_body.size() - 2)
		var yellow_new_head = yellow_body_copy[0] + yellow_snake_direction
		blue_body_copy.insert(0,blue_new_head)
		blue_snake_body = blue_body_copy
		yellow_body_copy.insert(0,yellow_new_head)
		yellow_snake_body = yellow_body_copy

func delete_tiles(id:int):
	var cells = $SnakeApple.get_used_cells_by_id(id)
	for cell in cells:
		$SnakeApple.set_cell(cell.x,cell.y,-1)
		
func _input(event):
	if Input.is_action_just_pressed("ui_up"): 
		if not blue_snake_direction == Vector2(0,1):
			blue_snake_direction = Vector2(0,-1)
		if not yellow_snake_direction == Vector2(0,-1):
			yellow_snake_direction = Vector2(0,1)
	if Input.is_action_just_pressed("ui_right"): 
		if not blue_snake_direction == Vector2(-1,0):
			blue_snake_direction = Vector2(1,0)
		if not yellow_snake_direction == Vector2(1,0):
			yellow_snake_direction = Vector2(-1,0)
	if Input.is_action_just_pressed("ui_left"): 
		if not blue_snake_direction == Vector2(1,0):
			blue_snake_direction = Vector2(-1,0)
		if not yellow_snake_direction == Vector2(-1,0):
			yellow_snake_direction = Vector2(1,0)
	if Input.is_action_just_pressed("ui_down"): 
		if not blue_snake_direction == Vector2(0,-1):
			blue_snake_direction = Vector2(0,1)
		if not yellow_snake_direction == Vector2(0,1):
			yellow_snake_direction = Vector2(0,-1)

func check_apple_eaten():
	if (apple_pos == blue_snake_body[0] and apple == true) or (apple_pos == yellow_snake_body[0] and apple == false):
		apple_pos = place_apple()
		# switch color apple
		if (apple):
			apple = false
		else:
			apple = true
			
		add_apple = true
		get_tree().call_group('ScoreGroup','update_score',blue_snake_body.size())
		$CrunchSound.play()

func check_game_over():
	var blue_head = blue_snake_body[0]
	var yellow_head = yellow_snake_body[0]
	# snake leaves the screen
	if blue_head.x > 19 or blue_head.x < 0 or blue_head.y < 0 or blue_head.y > 19:
		reset()
	
	# snake ate an apple of her own color
	if (apple_pos == blue_snake_body[0] and apple == false) or (apple_pos == yellow_snake_body[0] and apple == true):
		reset()
	
	# snake bites its own tail
	for blue_block in blue_snake_body.slice(1,blue_snake_body.size() - 1):
		if blue_block == blue_head:
			reset()
		if blue_block == yellow_head:
			reset()

func reset():
	blue_snake_body = [Vector2(5,9),Vector2(4,9),Vector2(3,9)]
	blue_snake_direction = Vector2(1,0)
	yellow_snake_body = [Vector2(14,10),Vector2(15,10),Vector2(16,10)]
	yellow_snake_direction = Vector2(-1,0)

func _on_SnakeTick_timeout():
	move_snake()
	draw_apple()
	draw_snake()
	check_apple_eaten()
	
	
func _process(delta):
	check_game_over()
	var pause = false
	if Input.is_action_pressed("ui_end") and pause == false:
		get_tree().paused = true
		pause = true
	if apple_pos in blue_snake_body:
		apple_pos = place_apple()
