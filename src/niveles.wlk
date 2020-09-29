import pepita.*
import comidas.*
import extras.*
import wollok.game.*

// Framework
// Es como una librería / biblioteca.
// Pero en una biblioteca, nosotros tenemos el control y usamos los objetos.
// En un framework, él tiene el control y usa nuestros objetos
object tutorial1 {

	method iniciar() {
		// Los visuales deben entender 2 mensajes:
		// position() 	-> Que devuelve una posición
		// image()		-> Devolver el nombre de la imagen que se quiere mostrar	
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisualCharacter(pepita)
	}

}

object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
	}

}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {

	method configurarTeclas() {
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1)) })
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1)) })
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1)) })
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1)) })
		keyboard.c().onPressDo({ pepita.comerLaComidaQueTenesDebajo()  })
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}

