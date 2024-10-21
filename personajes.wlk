import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*
import mapa.*

object pepe {
    var property position = game.center()
    var property image = "pepe-down.png"
    var monedas = 0


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
    
    method objetoDebajoDePepe() = game.uniqueCollider(self)

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
    
    method sumarMoneda() {
        monedas += 1
    }
    method monedasTotales() {
        return monedas
    }

    method decirMonedas(){
      game.say(self, "Tengo "+monedas+" monedas")
    }

    method entrarPorPuerta () {
        self.validarInteraccion()
        game.allVisuals().forEach({e => game.removeVisual(e)}) 
        mapa2.dibujar()
    }

    method haySolido(_position) {
		return game.getObjectsIn(_position).any({cosa => cosa.solida()})
	}

	method validarAtravesables(_position) {
		if (self.haySolido(_position)) {
			self.error("No puedo ir ahí")
		}
	}

    //method agarrarVisual(objeto) {
	//	self.agarrar(objeto)
	//	objeto.colision()
	//}

    //method agarrar(objeto) {
	//	monedas += monedas +1
	//}

    method solida() {
		return false
	}
}

