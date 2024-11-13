import personajes.*
import wollok.game.*
object arriba {
	method imagenDelJugador() = "pepite-back.png"
	method siguiente(position) {
		return position.up(1)
	}
}

object abajo {
	method imagenDelJugador() = "pepite-front.png"
	method siguiente(position) {
		return position.down(1)
	}	
}

object izquierda {
	method imagenDelJugador() = "pepite-left.png"
	method siguiente(position) {
		return position.left(1)
	}
}
object derecha {
	method imagenDelJugador() = "pepite-right.png"
	method siguiente(position) {
		return position.right(1)
	}
}