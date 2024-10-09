import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*

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
	  }
    method objetoDebajoDePepe() = game.colliders(self)

    method interactuarConObjeto() {
        self.validarInteraccion()
        const objeto = self.objetoDebajoDePepe().first()
        objeto.interactuar()
    }

    method validarInteraccion() {
        if (not self.hayObjetoAca()){
            self.error("No hay objeto para interactuar!")
        }
    }
    method hayObjetoAca() {
        return not self.objetoDebajoDePepe().isEmpty()
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
}

