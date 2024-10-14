import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*
import mapa.*

class Palanca {
    var property position 
    var property image = palancaPrendida.image()
    var property estado  = palancaPrendida

    method cambiarEstado(){
        self.validar()
        estado = estado.palancaCambiada()
    }
    method validar(){
        if (not territorio.hayPalanca()){
			self.error("no hay palanca en la posición actual")
		}
    }

    method solida() {
		return false
	}
}

object palancaPrendida{
   var property image = "palanca_prendida.png"
    
    method palancaCambiada(){
        return "palanca_apagada.png"
    }

    method solida() {
		return false
	}
}



object palancaApagada{
   var property image = "palanca_apagada.png"
    
    method palancaCambiada(){
        return "palanca_prendida.png"
    }

    method solida() {
		return false
	}

}


class Moneda {
    var property position 
    var property image = "moneda.png"

    method interactuar(){
        pepe.sumarMoneda()
        game.removeVisual(self)
    }

  //  method colision(personaje) {
	//	personaje.removeVisual(self)
	//}
    
    method solida() {
		return false
	}
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

class Puerta {
    var property position
    var property image = "puerta.png"
    var property estado = tableroActual

    method cambiarEstado(){
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


}

object tableroActual {
    
}

class Llave {
    var property position
    var property image = "llave.png"


    method interactuar() {
    
    }

    method solida() {
		return false
	}
}
