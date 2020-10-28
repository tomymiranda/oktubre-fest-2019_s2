import Carpas.*
import marcas.*
class Jarra {

	var property marca
	var property litros
	var carpaDondeSeSirvio = null
	var property precio = null
	
	method contenidoDeAlcohol(){
		return self.litros() * marca.graduacion()
	}

	
	method cargarCarpaDondeSeSirvio(carpa){
		carpaDondeSeSirvio = carpa.nombre()
	}
	
	method carpaDondeSeSirvio(){
		return carpaDondeSeSirvio
	}
 	
 	method tieneMasCapacidadQueOtraJarra(otraJarra){
 		return self.litros() > otraJarra.litros()
 	}
}