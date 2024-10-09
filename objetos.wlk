import territorio.*
import wollok.game.*
import posiciones.*

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
   var property image = "Objetos/Palanca_prendida.png"
    
    method palancaCambiada(){
        return "Objetos/Palanca_apagada.png"
    }
}
object palancaApagada{
   var property image = "Objetos/Palanca_apagada.png"
    
    method palancaCambiada(){
        return "Objetos/Palanca_prendida.png"
    }
}


class Moneda {
    var property position = game.center()
    var property image = "Objetos/Roca-chica.png"
    
}
