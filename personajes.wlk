import wollok.game.*
import posiciones.*

object pepe {
    var property position = game.center()
    const property image = "personajes/pepe.png"

    method mover(direccion) {
		position = direccion.siguiente(self.position())
	}

}