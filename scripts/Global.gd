extends Node

var life = 100
var max_life = 100
var parameters = {"wingLevel":1,"rocketLevel":1}


func change_parameter(name:String,value:int):
	
	parameters[name] = value
	get_tree().call_group("player","verify_parameters")
	
