class Jarra {

	var property marca
	var property litros
	var property cervezaCargada = null
	
	method contenidoDeAlcohol(){
		return self.litros() * cervezaCargada.graduacion()
	}

	method cargarCerveza(cerevezaACargar){
		self.cervezaCargada(cerevezaACargar)
	}

}