import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*
import mapa.*
import randomizer.*

class Palanca {
    var property position = game.center()
    var property estado  = palancaApagada
    const oceano

    method interactuar(){
       estado = estado.palancaCambiada()
       oceano.cambiar()
    }    
    method image(){
        return estado.image()
    }

    method solida() {
		  return false
    }

    method colision(personaje) {
		  // no queremos que al colisionar haga nada, pero por polimorfismo lo mantenemos
	}
}


object palancaPrendida{
   var property image = "palanca_prendida.png"
    
    method palancaCambiada(){
        return palancaApagada
    }
}



object palancaApagada{
   var property image = "palanca_apagada.png"
    
    method palancaCambiada(){
        return palancaPrendida
    }
}

class Moneda {
    var property position 
    var property image = "monedaDeOro.png"
    var property valor = 10

    method interactuar(){ // Teniendo el metodo "Colision" ya no es importante.
        //pepe.sumarMoneda()
        //game.removeVisual(self)      // no queremos el efecto de colisionar sea a a través de una tecla, pero por polimorfismo lo dejamos.
    }
    
    method solida() {
		return false
	}

    method colision(personaje) {
		  personaje.agarrarMoneda(self)
    }
}
class MonedaDePlata inherits Moneda(image = "monedaDePlata.png",valor = 50) {
}
class MonedaVioleta inherits Moneda(image = "monedaVioleta.png", valor = 100) {
  override method solida() {
		return true
	}
}
class MonedaDeBronce inherits Moneda(image = "monedaDeBronce.png",valor = 25) {
}

class Roca {
    var property position 
    var property image = "roca-chica.png"

    method solida() {
		return true
	}


}

class Puente {
    var property position
    var property image = "puenteD.png"

    method solida(){
      return false
    }

    method colision(personaje){

    }
}

class Oceano {
    var property position 
    var property image = "oceano.png"

    method solida() {
		  return false
	  }

    method colision(personaje) {
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})
		  lobby.dibujar()
      game.say(pepe,"me caí al oceano. se reinicia el juego")
    }
}

class OceanoFalso inherits Oceano{
    const palanca
    var property estado = oceanoPrendido

  method cambiar(){
       estado = estado.oceanoCambiado()
    }

  override method image(){
        return estado.image()
    } 

/*
  method cambiar(){
    if(self.estaPalancaPrendida()) {
      image = ""
//      self.noColision(pepe)
    } else {
      image = "oceano.png"
//      self.colision(pepe)
    }
  }
*/

  method estaPalancaPrendida() {
    return palanca.estado() == palanca.palancaPrendida()
  }

//  method noColision(personaje) {
  
//  }
  
}

object oceanoPrendido{
   var property image = "oceano.png"
    
    method oceanoCambiado(){
        return oceanoApagado
    }
}



object oceanoApagado{
   var property image = ""
    
    method oceanoCambiado(){
        return oceanoPrendido
    }
}



class PuertaANivel1 {
    var property position
    var property image = "puertaNueva.png"

    method validarPuerta(){
        if (not territorio.hayPuertaAca()){
			    self.error("No hay puerta en la posición actual")
		  }
    }

    method interactuar() {
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})
      self.dibujarSiguienteMapa()
    }

    method solida() {
		return false
	}

    method dibujarSiguienteMapa() {
      nivel1.dibujar()
    }

    method colision(personaje) {
		  
	}
}


class PuertaALobby inherits PuertaANivel1 {

  override method dibujarSiguienteMapa() {
    pepe.resetarDolares()
    lobby.dibujar()
  }
}


class PuertaANivel2 inherits PuertaANivel1 {
  override method dibujarSiguienteMapa() {
    pepe.actualizarDolares()
    nivel2.dibujar()
  }
}


class PuertaANivel3 inherits PuertaANivel2 {
 override method dibujarSiguienteMapa() {
    nivel3.dibujar()
  }
}

class PuertaANivel4 inherits PuertaANivel2 {
 override method dibujarSiguienteMapa() {
    nivel4.dibujar()
  }
}

class PuertaANivel5 inherits PuertaANivel2 {
 override method dibujarSiguienteMapa() {
    nivel5.dibujar()
  }
}

class PuertaDeAdorno  { // No la estamos usando pero anda.
  var property position
  var property image = "puertaNueva.png"
  
  
  method solida() {
		return false
	}
}

class Llave {
    var property position
    var property image = "llave.png"


    method interactuar() {
        game.removeVisual(self)
    }

    method solida() {
		return false
	}

  method colision(personaje) {
		  // no queremos que al colisionar haga nada, pero por polimorfismo lo mantenemos
	}
}

class Llave2 inherits Llave(image = "llave2.png") {
  override method solida() {
    return true
  }
}

class NPC {
  var property position
  var property image = "hector.png"


  method solida() { //EN EL FUTURO TIENE QUE SER TRUE 
		return false
	}

  method interactuar() {
        game.say(self, "¡HOLA VIAJERO!")
    }
  method colision(){
    // evita errores
  } 
}

class Tienda {
  var property position
  var property image = "tienda.png"


  method solida() { //EN EL FUTURO TIENE QUE SER TRUE 
		return false
	}

  method interactuar() {
        game.say(self, "No hay objetos para vender")
    }
  
  method colision(){
    // evita errores
  } 
}

object lamparitaFactory {

	method construir(position) {
		return new Lamparita(position=position)
	}
}

object administradorLamparas {
	
	const creados = #{} 
	const factories = [ lamparitaFactory]

	method nuevaLamparita() {
		if (self.hayEspacio()) {
			const comida = self.construirLampara()
			game.addVisual(comida)
			creados.add(comida)
		}
	}

	method construirLampara() {
		return factories.anyOne().construir(randomizer.emptyPosition()) 
	}

	method hayEspacio() {
		return creados.size() < 3
	}

	method remover(comida) {
		game.removeVisual(comida)
		creados.remove(comida)
	}
}
class Lamparita {
	const position

	method position() {
		return position
	}

	method image() {
		return "monedaDeOro.png"
	}
	method solida() {
		return false
	}

	method colision(personaje) {
		personaje.agarrarObjeto(self)
	}


}


/*
class Caja {
  var property position
  var property image = "caja.png"

  method colision(){
    personaje.empujar(direccion)
  }
  
}
*/