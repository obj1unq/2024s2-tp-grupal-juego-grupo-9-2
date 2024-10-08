import personajes.*
import wollok.game.*
object arriba {
	method imagenDelJugador() = "Personajes/Pepe/pepe-up.png"
	method siguiente(position) {
		return position.up(1)
	}
}

object abajo {
	method imagenDelJugador() = "Personajes/Pepe/pepe-down.png"
	method siguiente(position) {
		return position.down(1)
	}	
}

object izquierda {
	method imagenDelJugador() = "Personajes/Pepe/pepe-left.png"
	method siguiente(position) {
		return position.left(1)
	}
}
object derecha {
	method imagenDelJugador() = "Personajes/Pepe/pepe-right.png"
	method siguiente(position) {
		return position.right(1)
	}
}