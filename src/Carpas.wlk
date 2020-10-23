import Jarra.*
import marcas.*
import Personas.*
import objects.*

class Carpa {

	//suponiendo que se identifican por un nombre
	const property nombre
	//el enunciado no dice que debe indicarse por ende deduzco que la cantidad de personas es fijo
	const property limiteDePersonas = 30
	var property tieneBandaDeMusicaTradicional
	const property personasDentro = []
	//suponiendo que pueden cambiar la cerveza que venden
	var property cervezaQueVende
	var property recargoParaVenta

	method cantidadDePersonasEnLaCarpa() {
		return personasDentro.size()
	}

	method porcentajeDeCapacidad(porcentaje) {
		return self.limiteDePersonas() * porcentaje
	}

	method cantidadDeEbrios() {
		return personasDentro.count({ i => i.estaEbrio() })
	}

	method dejarIngresarA_(persona) {
		return self.cantidadDePersonasEnLaCarpa() < self.limiteDePersonas() && not persona.estaEbrio()
	}

	method puedeEntrar(persona) {
		return persona.quiereEntrarAUnaCarpa(self) && self.dejarIngresarA_(persona)
	}

	method entrarPersonaAlaCarpa(persona) {
		if (self.puedeEntrar(persona) && not persona.estaDentroDeUnaCarpa()) {
			persona.entroEnUnaCarpa()
			personasDentro.add(persona)
						
		} else {
			self.error("no puede entrar")
		}
	}
	
	method sacarPersonaDeLaCarpa(persona){
		personasDentro.remove(persona)
		persona.salioDeUnaCarpa()
		
	}

	// dice a una persona, por ende se le debe indicar, lo interpreto asi
	method servirCerveza(persona, capacidadDeJarra) {
		if (personasDentro.contains(persona)) {
			persona.tomarJarraDeCerveza(new Jarra(marca = self.cervezaQueVende().toString(), litros = capacidadDeJarra))
			persona.jarras().get(persona.jarras().size() - 1).cargarCerveza(self.cervezaQueVende())
			persona.jarras().get(persona.jarras().size() - 1).cargarCarpaDondeSeSirvio(self)
			persona.jarras().get(persona.jarras().size() - 1).precio(self.precioDeVenta() * persona.jarras().get(persona.jarras().size() - 1).litros())
		}else{
			self.error("no esta la persona en la carpa")
		}
	}

	method ebriosEmperdinosDentroDeLaCarpa() {
		return personasDentro.count({ i => i.esEbrioEmperdino() })
	}

	method esHomogenea() {
		return personasDentro.all({ i => i.paisDondeProcede().equals(personasDentro.first().paisDondeProcede()) })
	}

	method personasAlasNoQueSeLeSivieronCervezaEnEstaCarpa() {
		return personasDentro.filter({ i => not i.seSirvioAlgunaCervezaEnLaCarpa_(self) })
	}

	method precioDeVenta() {
		return cervezaQueVende.precioPorLitro() + recargoParaVenta.recargo(self)
	}

	method cambiarRecargo(recargo) {
		self.recargoParaVenta(recargo)
	}

}

