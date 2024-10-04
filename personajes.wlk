import wollok.game.*
import posiciones.*
import objetos.*

object pepe {
    var property position = game.center()
    const property image = "personajes/Pepe_de_frente.png"

    method mover(direccion) {
		position = direccion.siguiente(self.position())
	} 
  method moverPalanca(){
    self.validarSiHayPalanca()
    Palanca.cambiarEstado()
  }

  method validarSiHayPalanca(){
  }
}

