import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*

class Palanca {
    var property position = game.center()
    var property image = estado.image()
    var property estado  = palancaPrendida

    method interactuar(){
       estado = estado.palancaCambiada()
       image = estado.image() 
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
    var property position = game.center()
    var property image = "roca-chica.png"

    method interactuar(){
        pepe.sumarMoneda()
        game.removeVisual(self)
    }
    
}
