import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*
import mapa.*

object pepe {
    var property position = game.center()
    var property image = "pepite-back.png"
    var property nivelActual = lobby
    var property cantSombreros = 0

    var dolaresTotales = 0
    var dolaresNivel = 0

    // method imagenDelJugador() { 
    //     imagen = 
    // }

    method mover(direccion) {
      self.validarMover(direccion)
		  position = direccion.siguiente(self.position())
      image = direccion.imagenDelJugador()
      game.sound("walking.mp3").play()
      }

    method validarMover(direccion) {
      const siguiente = direccion.siguiente(self.position())
      territorio.validarDentro(siguiente)
      self.validarAtravesables(siguiente)
	  }
    
    method objetosDebajoDePepe() = game.colliders(self) // Lo que hay abajo de Pepe.

    method interactuarConObjeto() {
        self.validarInteraccion()
        var objeto = self.objetosDebajoDePepe().first()
        if(self.objetosDebajoDePepe().size() > 1){
            objeto = self.objetosDebajoDePepe().last()            
        }
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

    method resetarDolares(){
        dolaresNivel = 0
    }

    method sumarDolar(moneda) {
        dolaresNivel += moneda.valor()
    }
    method dolaresTotales() {
        return dolaresTotales
    }
    method actualizarDolares(){
        dolaresTotales += dolaresNivel
    }
    method decirDolares(){
      game.say(self, "Tengo "+dolaresTotales+" dolares")
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
    method reinicio(){
        game.removeVisual(self)
        self.position(9.9)
        game.addVisual(self)
    }

    method agarrarMoneda(moneda) {
        self.sumarDolar(moneda)
        game.removeVisual(moneda)
    }


    method agarrarObjeto(objeto) {  
        self.sumarObjeto()
        administradorSombreros.remover(objeto)
    }
    method sumarObjeto() {
        cantSombreros += 1
    }


    method tieneSombrerosInsuficientes() {
        return cantSombreros < 5
    }


    method agarrarTrofeo(trofeo) {  
        //self.sumarObjeto()
        administradorSombreros.remover(trofeo) //Revisar
    }
}

