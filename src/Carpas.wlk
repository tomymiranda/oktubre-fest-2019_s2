import Jarra.*

class Carpa {

	var property limiteDePersonas = 30
	var property tieneBandaDeMusicaTradicional
	const property personasDentro = []
	var property cervezaQueVende

	method cantidadDePersonasEnLaCarpa(){
		return personasDentro.size()
	}

	method dejarIngresarA_(persona){
		return self.cantidadDePersonasEnLaCarpa() < self.limiteDePersonas() && not persona.estaEbrio()
	}

	method puedeEntrar(persona){
		return persona.quiereEntrarAUnaCarpa(self) && self.dejarIngresarA_(persona)
	}

	method entrarPersonaAlaCarpa(persona){
		if(self.puedeEntrar(persona)){
			personasDentro.add(persona)
		}
	}

	method servirCerveza(persona,capacidadDeJarra){
		persona.tomarJarraDeCerveza(new Jarra(marca = self.cervezaQueVende().toString(),litros =capacidadDeJarra).cargarCerveza(self.cervezaQueVende()))
	}

	method ebriosEmperdinosDentroDeLaCarpa(){
		return personasDentro.count({i => i.esEbrioEmperdino()})
	}
}

