class Persona {

	var property peso
	const property jarras = []
	var property leGustaLaMusica
	var property aguante

	method estaEbrio() {
		return self.totalDeAlcoholIngerido() * self.peso() > self.aguante()
	}

	method totalDeAlcoholIngerido() {
		return jarras.sum({ i => i.contenidoDeAlcohol() })
	}

	method tomarJarraDeCerveza(jarraDeCerveza) {
		jarras.add(jarraDeCerveza)
	}

	method quiereEntrarAUnaCarpa(carpa) {
		return self.leGustaLaCerveza_(carpa.cervezaQueVende()) && self.leGustaLaMusica().equals(carpa.tieneBandaDeMusicaTradicional())
	}

	method esEbrioEmperdino() {
		return jarras.all({ i => i.litros() >= 1 })
	}

	method esPatriota() {
		return jarras.all({ i => i.cervezaCargada().paisDondeSeFabrico().equals(self.paisDondeProcede()) })
	}

	// es la manera que se me ocurrio acepto mejoras
	method esCompatibleCon_(persona) {
		return jarras.asSet().intersection(persona.jarras().asSet()).size() > jarras.asSet().difference(persona.jarras().asSet()).size()
	}

	method seSirvioCervezaEnUnaCarpa_(carpa) {
		return jarras.any({ i => i.carpaDondeSeSirvio().equals(carpa.codigoCarpa()) })
	}

	// no se si esta bien
	
	method estaEntrandoEnElVicio(){
		return jarras.all({a,b => b.tieneMasCapacidadQueOtraJarra(a)})
	}


	// metodo abstracto
	method leGustaLaCerveza_(cerveza)

	// metodo abstracto para no usar el toString() [si usara toString() me devolveria "un/a Belga" en vez de belgica]
	method paisDondeProcede()

}

class Belga inherits Persona {

	override method leGustaLaCerveza_(cerveza) {
		return cerveza.gramosDeLupusPorLitro() > 4
	}

	override method paisDondeProcede() {
		return "belgica"
	}

}

class Aleman inherits Persona {

	override method leGustaLaCerveza_(cerveza) {
		return true
	}

	override method quiereEntrarAUnaCarpa(carpa) {
		return super(carpa) && carpa.cantidadDePersonasEnLaCarpa() % 2 == 0
	}

	override method paisDondeProcede() {
		return "alemania"
	}

}

class Checo inherits Persona {

	override method leGustaLaCerveza_(cerveza) {
		return cerveza.graduacion() > 0.08
	}

	override method paisDondeProcede() {
		return "checoslovaquia"
	}

}

