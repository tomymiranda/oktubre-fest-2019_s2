import Jarra.*
import marcas.*
import Personas.*
import objects.*

class Carpa {

	var property limiteDePersonas = 30
	var property tieneBandaDeMusicaTradicional
	const property personasDentro = []
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
		if (self.puedeEntrar(persona)) {
			personasDentro.add(persona)
			
		} else {
			self.error("no puede entrar")
		}
	}

	// dice a una persona, por ende se le debe indicar, lo interpreto asi
	method servirCerveza(persona, capacidadDeJarra) {
		if (personasDentro.contains(persona)) {
			persona.tomarJarraDeCerveza(new Jarra(marca = self.cervezaQueVende().toString(), litros = capacidadDeJarra))
			persona.jarras().get(persona.jarras().size() - 1).cargarCerveza(self.cervezaQueVende())
			persona.jarras().get(persona.jarras().size() - 1).cargarCarpaDondeSeSirvio(self)
			persona.jarras().get(persona.jarras().size() - 1).precio(self.precioDeVenta() * persona.jarras().get(persona.jarras().size() - 1).litros())
		}
	}

	method ebriosEmperdinosDentroDeLaCarpa() {
		return personasDentro.count({ i => i.esEbrioEmperdino() })
	}

	method codigoCarpa() {
		return self.identity()
	}

	method esHomogenea() {
		return personasDentro.all({ i => i.paisDondeProcede().equals(personasDentro.first().paisDondeProcede()) })
	}

	// no se si esta bien
	method personasAlasNoQueSeLeSivieronCervezaEnEstaCarpa() {
		return personasDentro.filter({ i => not i.seSirvioCervezaEnUnaCarpa_(self) })
	}

	method precioDeVenta() {
		return cervezaQueVende.precioPorLitro() + recargoParaVenta.recargo(self)
	}

	method cambiarRecargo(recargo) {
		self.recargoParaVenta(recargo)
	}

}

