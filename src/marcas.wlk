class Marca {

	const property gramosDeLupusPorLitro
	const property paisDondeSeFabrico

	// método abstracto
	method graduacion()

}

class MarcaCervezaRubia inherits Marca {

	var property graduacionDeCerveza

	override method graduacion() {
		return self.graduacionDeCerveza()
	}

}

class MarcaCervezaNegra inherits Marca {

	const graduacionDeCerverza = graduacionReglamentaria

	override method graduacion() {
		return graduacionDeCerverza.graduacionReglamentaria().min(self.gramosDeLupusPorLitro() * 2)
	}


}

class MarcaCervezaRoja inherits MarcaCervezaNegra {

	override method graduacion() {
		return super() * 1.25
	}

}

object graduacionReglamentaria {

	var property graduacionReglamentaria = 0.064

}





