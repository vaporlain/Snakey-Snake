extends Node2D

# class member variables go here
var start = false;
var speed = 1.0;
var row = 3;
var butto; var lebl; var food; var playpos; var spawned; var foodpos; var screen_size; var gameover; var playsize;
const SPEED = 300; 

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	initializer();
	pass

#Init function!
func initializer():
	butto = get_node("Button");
	lebl = get_node("titleLabel");
	food = get_node("foodSprite");
	playsize = get_node("playerSprite").get_texture().get_size();
	spawned = false; gameover == true;
	screen_size = get_viewport_rect().size 

#spawn food functie
func spawnfood():
	#krijg positie
	var foodpos = Vector2(get_node("foodSprite").get_pos());
	
	#genereer random nummers voor x en y
	var rand; var rand2;
	rand = randf()*screen_size.x-50;
	rand2 = randf()*screen_size.y-50;
	
	#debug
	print("Rand: " + str(rand));
	print("Rand2: " + str(rand2));
	
	#bereken nieuwe positie
	foodpos.y = rand2;
	foodpos.x = rand;
	
	get_node("foodSprite").set_pos(foodpos);
	
	spawned = true; 

func _on_Area2D_area_enter():
	print("on aera enter");
	

#DE PROCESS FUNCTIE, ELKE FRAME BEHALVE BIJ PHYSICS
func _process(delta):
	
	if (butto.is_pressed() == true and start == false):
		print("Game has started!");
		start = true;
		butto.set_hidden(true);
		lebl.set_hidden(true);
		
	
	if ( gameover == true ):
		playpos.pos = screen_size*0.5;
		#gameover = false;
	
	if(spawned == false):
		spawnfood();
	
	#krijg positie
	var playerpos = get_node("playerSprite").get_pos();
	
	if (start == true) :
		
		#pas positie aan
		if (Input.is_action_pressed("player_up")):
			playerpos.y += -SPEED * delta;
		elif (Input.is_action_pressed("player_down")):
			playerpos.y += SPEED * delta;
		elif (Input.is_action_pressed("player_left")):
			playerpos.x += -SPEED * delta;
		elif (Input.is_action_pressed("player_right")):
			playerpos.x += SPEED * delta;
		
	#pas de positie weer aan
	get_node("playerSprite").set_pos(playerpos);
	
	#hier eindigt _process let op

