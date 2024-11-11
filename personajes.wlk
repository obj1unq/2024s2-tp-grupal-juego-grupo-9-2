import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*
import mapa.*

object pepe {
    var property position = game.center()
    var property image = "pepe2.png"
    var dolares = 0

    // method imagenDelJugador() { 
    //     imagen = 
    // }

    method mover(direccion) {
      self.validarMover(direccion)
		  position = direccion.siguiente(self.position())
      image = direccion.imagenDelJugador()
	  }

    method validarMover(direccion) {
      const siguiente = direccion.siguiente(self.position())
      territorio.validarDentro(siguiente)
      self.validarAtravesables(siguiente)
	  }
    
    method objetoDebajoDePepe() = game.uniqueCollider(self) // Lo que hay abajo de Pepe.

    method interactuarConObjeto() {
        self.validarInteraccion()
        const objeto = self.objetoDebajoDePepe()
        objeto.interactuar()
    }

    method validarInteraccion() {
        if (not self.hayObjetoAca()){
            self.error("No hay objeto para interactuar!")
        }
    }
    method hayObjetoAca() {
        return not game.colliders(self).isEmpty()
    }
    
    method sumarDolar(moneda) {
        dolares += moneda.valor()
    }
    method dolaresTotales() {
        return dolares
    }
    method decirDolares(){
      game.say(self, "Tengo "+dolares+" dolares")
    }
    
    method haySolido(_position) {
		return game.getObjectsIn(_position).any({cosa => cosa.solida()})
	}

	method validarAtravesables(_position) {
		if (self.haySolido(_position)) {
			self.error("No puedo ir ahí")
		}
	}

    method solida() {
		return false
	}

    method agarrarVisual(moneda) {
        self.sumarDolar(moneda)
		game.removeVisual(moneda)
	}    
}

