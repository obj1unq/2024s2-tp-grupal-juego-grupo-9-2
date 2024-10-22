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

    method interactuar(){ // Teniendo el metodo "Colision" ya no es importante.
        //pepe.sumarMoneda()
        //game.removeVisual(self)
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

class MonedaDePlata inherits Moneda(image = "moneda-plata.png") {
 
}


class MonedaVioleta inherits Moneda(image = "moneda-violeta.png") {
  override method solida() {
		return true
	}
}


class MonedaDeBronce inherits Moneda(image = "moneda-bronce.png") {
 
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

class Puerta1 {
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
      mapa2.dibujar()
    }

    method colision(personaje) {
		  
	}
}


class Puerta0 inherits Puerta1 {
  override method dibujarSiguienteMapa() {
    mapa1.dibujar()
  }
}


class Puerta2 inherits Puerta1 {
  override method dibujarSiguienteMapa() {
    mapa3.dibujar()
  }
}


class Puerta3 inherits Puerta1 {
 override method dibujarSiguienteMapa() {
    mapa4.dibujar()
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
		  
	}
}

class Llave2 inherits Llave(image = "llave2.png") {
  override method solida() {
    return true
  }
}