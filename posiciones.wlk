import personajes.*
import wollok.game.*
object arriba {
	method imagenDelJugador() = "pepe2.png"
	method siguiente(position) {
		return position.up(1)
	}
}

object abajo {
	method imagenDelJugador() = "pepe2.png"
	method siguiente(position) {
		return position.down(1)
	}	
}

object izquierda {
	method imagenDelJugador() = "pepe2.png"
	method siguiente(position) {
		return position.left(1)
	}
}
object derecha {
	method imagenDelJugador() = "pepe2.png"
	method siguiente(position) {
		return position.right(1)
	}
}