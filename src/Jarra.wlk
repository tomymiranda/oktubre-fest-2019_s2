import Carpas.*

class Jarra {

	var property marca
	var property litros
	var property cervezaCargada = null
	var carpaDondeSeSirvio = null
	var property precio = null
	
	method contenidoDeAlcohol(){
		return self.litros() * cervezaCargada.graduacion()
	}

	method cargarCerveza(cerevezaACargar){
		self.cervezaCargada(cerevezaACargar)
	}
	
	method cargarCarpaDondeSeSirvio(carpa){
		carpaDondeSeSirvio = carpa.codigoCarpa()
	}
	
	method carpaDondeSeSirvio(){
		return carpaDondeSeSirvio
	}
 
}