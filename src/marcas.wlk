class Marca {

	var property gramosDeLupusPorLitro
	var property paisDondeSeFabrico
	// se pone 15 para que no me rompa el constructor de los test hasta termine el bonus
	var property precioPorLitro = 15

	// método abstracto
	method graduacion()
	
	method cambiarPrecio(nuevoPrecio){
		self.precioPorLitro(nuevoPrecio)
	}

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





