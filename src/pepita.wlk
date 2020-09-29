import extras.*
import wollok.game.*

object pepita {

	var property energia = 100
	var property position = game.origin()

	method image() {
		return if (self.atrapada() or self.estaCansada()) "pepita-gris.png" else if (self.estaEnElNido()) "pepita-grande.png" else "pepita.png"
	}

	method come(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method comerLaComidaQueTenesDebajo() {
		self.come(self.comidaDebajo())
		game.removeVisual(self.comidaDebajo())
	}
	
	method comidaDebajo() {
		const comidas = game.colliders(self)
		if (comidas.isEmpty()) {
			self.error("No hay comida acá")
		}
		return comidas.head()
	}

	method vola(kms) {
		energia = energia - kms * 9
	}

	method irA(nuevaPosicion) {
		self.validarParaMoverse()
		self.vola(position.distance(nuevaPosicion))
		position = nuevaPosicion
	}

	method validarParaMoverse() {
		if (self.estaCansada()) {
			self.error("Estoy cansada")
		}
	}

	method estaCansada() {
		return energia <= 0
	}

	method estaEnElNido() {
		return position == nido.position()
	}

	method atrapada() {
		return position == silvestre.position()
	}

}

