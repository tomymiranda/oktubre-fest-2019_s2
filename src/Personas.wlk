class Persona {

	var property peso
	const property jarras = []
	var property leGustaLaMusica
	var property aguante
	var property estaDentroDeUnaCarpa = false

	/*
	 * los metodos salioDeUnaCarpa() y entroEnUnaCarpa() los pongo porque no tiene sentido que una persona este al mismo tiempo en 2 carpas distintas
	 */
	method salioDeUnaCarpa() {
		estaDentroDeUnaCarpa = false
	}

	method entroEnUnaCarpa() {
		estaDentroDeUnaCarpa = true
	}

	method estaEbrio() {
		return self.totalDeAlcoholIngerido() * self.peso() > self.aguante()
	}

	method totalDeAlcoholIngerido() {
		return jarras.sum({ i => i.contenidoDeAlcohol() })
	}

	method cantidadDeJarraMasGrande() {
		return jarras.map({ i => i.litros() }).max()
	}

	method tomarJarraDeCerveza(jarraDeCerveza) {
		jarras.add(jarraDeCerveza)
	}

	method quiereEntrarAUnaCarpa(carpa) {
		return self.leGustaLaCerveza_(carpa.cervezaQueVende()) && self.leGustaLaMusica() == carpa.tieneBandaDeMusicaTradicional()
	}

	method esEbrioEmperdino() {
		return self.estaEbrio() and jarras.all({ i => i.litros() >= 1 })
	}

	method esPatriota() {
		return jarras.all({ i => i.cervezaCargada().paisDondeSeFabrico() == self.paisDondeProcede() })
	}

	method esCompatibleCon_(persona) {
		return self.cantidadDeMarcasCompatibleCon_(persona) > self.cantidadDeMarcasDiferentesCon_(persona)
	}

	method cantidadDeMarcasCompatibleCon_(persona) {
		return jarras.map({ i => i.marca() }).asSet().intersection(persona.jarras().map({ i => i.marca() }).asSet()).size()
	}

	method cantidadDeMarcasDiferentesCon_(persona) {
		return jarras.map({ i => i.marca() }).asSet().difference(persona.jarras().map({ i => i.marca() }).asSet()).size()
	}

	method seSirvioAlgunaCervezaEnLaCarpa_(carpa) {
		return jarras.any({ i => i.carpaDondeSeSirvio().equals(carpa.nombre()) })
	}

	method estaEntrandoEnElVicio() {
		if (jarras.size() <= 1) {
			return false
		} else {
			return (1 .. jarras.size() - 1).all({ i => jarras.get(i).litros() >= jarras.get(i - 1).litros() })
		}
	}

	method gastoTotalEnCerveza() {
		return jarras.sum({ i => i.precio() })
	}

	method jarraDeCervezaMasCara() {
		return jarras.max({ i => i.precio() })
	}

	// metodo abstracto
	method leGustaLaCerveza_(cerveza)

	// metodo abstracto para no usar el toString() [si usara toString() me devolveria "un/a Belga" en vez de belgica], no se si aca se puede sobreescribir
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

