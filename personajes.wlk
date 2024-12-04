import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*
import mapa.*


object tierra {
    method fondo() {
        return 0
    }
}

object mar {
    method fondo() {
        return 1
    }
}

object pepe {
    var property position = game.center()
    var property image = "pepite-back.png"
    var property nivelActual = lobby
    var property cantSombreros = 0
    const property trofeos = []
    var property estadoParaFondo = tierra

    method fondo() {
        return self.estadoParaFondo().fondo()
    }

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

    method agarrarVisual(visual) {
		game.removeVisual(visual)
	}

    method agregarTrofeo(trofeo){
        game.removeVisual(trofeo)
        self.trofeos().add(trofeo)
    }

    method reinicio(){
        game.removeVisual(self)
        self.position(9.9)
        game.addVisual(self)
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

    method tieneMasDeDosTrofeos() {
        return self.cantidadDeTrofeos() > 2
    }

    method cantidadDeTrofeos(){
        return self.trofeos().size()
    }
}


// ---------- NPCs ----------
class NPC {
    var property position
    var property image = "hector.png"

    method colision(pepe)

    method solida() { 
        return false
    }

    method interactuar() {

    }
}

class Hector inherits NPC(image = "hector.png"){
    override method interactuar() {
        game.say(self, "¡HOLA VIAJERO!")
    }
    override method colision(pepe){
        game.say(self, "¡AUCH!")
        game.sound("hector.mp3").play()
    } 
}

class Ringo inherits NPC(image = "ringo.png"){
 
  override method colision(pepe){
    game.say(self,"Hola pepite te extrañé!")
    game.schedule(3000, {game.allVisuals().forEach({bg=>game.removeVisual(bg)})
                         background.bgActual(bgFinal)
                         background.iniciar()
                         game.sound("victoryTheme.mp3").play()
                        }
                )                    
  }
}