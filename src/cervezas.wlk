class Cerveza {
 	var property lupulo
 	var property pais
}
 
class Rubia inherits Cerveza {
 	var property graduacion
}
 
class Negra inherits Cerveza {	
 	method graduacion() {
 		return graduacionMundial.graduacion().min(lupulo* 2)
 	} 
}

class Roja inherits Negra {
	override method graduacion() {
		return super() * 1.25
	}
}

object graduacionMundial {
	var property graduacion
}

class Jarra {
	var property marca
	var property litros
	method cantidadAlcohol() {
		return (marca.graduacion() / 100) * litros
	}
}