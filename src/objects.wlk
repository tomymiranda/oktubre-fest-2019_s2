object recargoFijo {

	method recargo(carpa) {
		return carpa.cervezaQueVende().precioPorLitro() * 0.3
	}

}

object recargoPorCantidad {

	method recargo(carpa) {
		if (carpa.cantidadDePersonasEnLaCarpa() >= carpa.porcentajeDeCapacidad(0.5)) {
			return carpa.cervezaQueVende().precioPorLitro() * 0.4
		} else {
			return carpa.cervezaQueVende().precioPorLitro() * 0.25
		}
	}

}

object recargoPorEbriedad {

	method recargo(carpa){
		if(carpa.cantidadDeEbrios() >= carpa.porcentajeDeCapacidad(0.75) ){
			return carpa.cervezaQueVende().precioPorLitro() * 0.5
		}else{
			return carpa.cervezaQueVende().precioPorLitro() * 0.2
		}
	}
	

}

