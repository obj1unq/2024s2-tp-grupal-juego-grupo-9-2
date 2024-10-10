import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*
import mapa.*

class Palanca {
    var property position = game.center()
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
}

object palancaPrendida{
   var property image = "palanca_prendida.png"
    
    method palancaCambiada(){
        return "palanca_apagada.png"
    }
}
object palancaApagada{
   var property image = "palanca_apagada.png"
    
    method palancaCambiada(){
        return "palanca_prendida.png"
    }
}


class Moneda {
    var property position 
    var property image = "roca-chica.png"

    method interactuar(){
        pepe.sumarMoneda()
        game.removeVisual(self)
    }
    
}

class Puerta {
    var property position
    var property image = "roca-chica.png"


    method interactuar() {
    //image = "roca-grande.png"
    
    
    }
}
