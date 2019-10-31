import cervezas.*
import carpas.*

 class Persona {
 	var property peso
 	var property jarrasCompradas = []
 	var property leGustaMusicaTradicional = true
 	var property aguante
 	var property nacionalidad
 	
 	method comprarJarra(jarra) {
 		jarrasCompradas.add(jarra)
 	}
 	
 	method estaEbria() {
 		return self.totalAlcohol()*peso > aguante
 	}
 	
 	method totalAlcohol() {
 		return jarrasCompradas.sum({ jarra => jarra.cantidadAlcohol()})
 	}
 	method leGustaCerveza(cerveza) {
 		return nacionalidad.leGustaCerveza(cerveza)
 	}
 	
 	method quiereEntrarACarpa(carpa) {
 		return self.leGustaCerveza(carpa.vendeMarca()) and (self.leGustaMusicaTradicional() == carpa.tieneBandaTradicional()) and nacionalidad.requisito(carpa) 
 	} 
 	
 	method puedeIngresar(carpa) {
 		return self.quiereEntrarACarpa(carpa) and carpa.dejaIngresar(self)
 	}
 	
 	method todasLasJarrasTieneMasDe(litros) {
 		return jarrasCompradas.all({ jarra => jarra.litros() >= litros })
 	}
 	
 	method ingresarACarpa(carpa){
 		if (self.puedeIngresar(carpa) and self.quiereEntrarACarpa(carpa)) {
 			carpa.hacerIngresar(self)
 		}
 		else if (not self.puedeIngresar(carpa) and self.quiereEntrarACarpa(carpa)) {
 			self.error("no puede ingresar a la carpa")
 		}
 	}
 	method esPatriota() {
 		return jarrasCompradas.all({ jarra => jarra.marca().pais() == nacionalidad.pais()})
 	}
 	
 	method sonCompatibles(otraPersona) {
		return self.coincidencias(otraPersona).size() > self.diferencias(otraPersona).size()
	}
	
	method marcasCompradas() {
		return jarrasCompradas.map({ jarra => jarra.marca()}).asSet()
	}
	
	method coincidencias(otraPersona) {
		return self.marcasCompradas().intersection(otraPersona.marcasCompradas())
	}
	
	method diferencias(otraPersona) {
		return self.marcasCompradas().difference(otraPersona.marcasCompradas())
	}

 }
 
 object belga {
 	const property pais = "Bélgica"
 	method leGustaCerveza(cerveza) {
 		return cerveza.lupulo() > 4
 	}
 	method requisito(carpa) = true
 }
 
 object checa {
 	const property pais = "República Checa"
 	method leGustaCerveza(cerveza) {
 		return cerveza.graduacion() > 8
 	}
 	method requisito(carpa) = true
 }
 
object alemana {
 	const property pais = "Alemania"
 	method leGustaCerveza(cerveza) = true
 	method requisito(carpa) {
 		return carpa.personas().size().even()
 	}
}
