extends Node

var life = 100
var max_life = 100
var parameters = {"wingLevel":3,"rocketLevel":3}

var lv_dificult = 0

func change_parameter(name:String,value:int):
	
	parameters[name] = value
	get_tree().call_group("player","verify_parameters")
	
