import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*
import mapa.*

class Palanca {
    var property position = game.center()
    var property estado  = palancaPrendida

    method interactuar(){
       estado = estado.palancaCambiada()
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
    var property image = "moneda.png"
    var property valor = 10

    method interactuar(){ // Teniendo el metodo "Colision" ya no es importante.
        //pepe.sumarMoneda()
        //game.removeVisual(self)      // no queremos el efecto de colisionar sea a a través de una tecla, pero por polimorfismo lo dejamos.
    }

  //  method colision(personaje) {
	//	personaje.removeVisual(self)
	//}
    
    method solida() {
		return false
	}

    method colision(personaje) {
		  personaje.agarrarVisual(self)
    }
}

class MonedaDePlata inherits Moneda(image = "moneda-plata.png",valor = 50) {
 
}


class MonedaVioleta inherits Moneda(image = "moneda-violeta.png", valor = 100) {
  override method solida() {
		return true
	}
}


class MonedaDeBronce inherits Moneda(image = "moneda-bronce.png",valor = 25) {
 
}

class Roca {
    var property position 
    var property image = "roca-chica.png"

    method solida() {
		return true
	}

    
}

class Oceano {
    var property position 
    var property image = "oceano.png"

    method solida() {
		return true
	}
}

class PuertaANivel1 {
    var property position
    var property image = "puerta.png"
    var property estado = tableroActual

    method cambiarEstado(){ // ESTE METODO NO HACE NADA. REVISAR!
        self.validarPuerta()
        estado = estado.tableroActual()
    }
    method validarPuerta(){
        if (not territorio.hayPuertaAca()){
			self.error("No hay puerta en la posición actual")
		}
    }

    method interactuar() {
    
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


class Lobby inherits PuertaANivel1 {
  override method dibujarSiguienteMapa() {
    lobby.dibujar()
  }
}


class PuertaANivel2 inherits PuertaANivel1 {
  override method dibujarSiguienteMapa() {
    nivel2.dibujar()
  }
}


class PuertaANivel3 inherits PuertaANivel1 {
 override method dibujarSiguienteMapa() {
    nivel3.dibujar()
  }
}

class PuertaANivel4 inherits PuertaANivel1 {
 override method dibujarSiguienteMapa() {
    nivel4.dibujar()
  }
}

class PuertaANivel5 inherits PuertaANivel1 {
 override method dibujarSiguienteMapa() {
    nivel5.dibujar()
  }
}

class PuertaDeAdorno  {
  var property position
  var property image = "puerta.png"
  
  
  method solida() {
		return true
	}
}



object tableroActual { // POSIBLEMENTE NO HACE NADA.
    
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
}