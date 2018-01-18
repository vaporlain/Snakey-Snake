extends Node2D

# class member variables go here, for example:
var screen_size;
var pad_size;
var nextscene;
var started = false;

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	#nextscene = preload("res://pong.tscn") # will load when parsing the script
	#var node = nextscene.instance(); #add_child(node);
	set_process(true)
	screen_size = get_viewport_rect().size
	pass

func _process(delta):
	if (Input.is_action_pressed("enter") and started == false):
		print("onkeydown enter");# resource is loaded when line is executed
		get_node("Label1").set_hidden(true);
		get_node("Label").set_hidden(true);
		get_node("pongnode").set_hidden(false);
		remove_child(Node2D);
		started = true;
	