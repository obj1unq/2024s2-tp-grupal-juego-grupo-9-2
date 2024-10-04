import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*

object pepe {
    var property position = game.center()
    var property image = "Pepe/Pepe_de_frente.png"

    method mover(direccion) {
		position = direccion.siguiente(self.position())
	} 
  method moverPalanca(){
    territorio.validarSiHayPalanca()
    Palanca.cambiarEstado()
  }

  method validarSiHayPalanca(){
    
  }
}

