import personas.*
import cervezas.*

class Carpa {
	var property limiteGente = 300
	var property tieneBandaTradicional = true
	var property vendeMarca 
	var property personas = []
	
	method hacerIngresar(persona) {
		personas.add(persona)
	}
	method dejaIngresar(persona) {
		return self.personas().size() + 1 <= limiteGente and not persona.estaEbria()
	}
	method estaEnLaCarpa(persona) {
		return personas.contains(persona)
	}
	method venderCerveza(persona, litrosIndicados) {
		if (self.estaEnLaCarpa(persona)) {
			persona.comprarJarra( new Jarra(marca = vendeMarca, litros = litrosIndicados) )
		}
		else {
			self.error("esta persona no se encuentra en la carpa")
		}
	}
	method ebriosEmperdernidos() {
		return self.ebrios().count({ persona => persona.todasLasJarrasTieneMasDe(1) }) 
	}
	method ebrios() {
		return personas.filter({ persona => persona.estaEbria()})
	}

}