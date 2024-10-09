import wollok.game.*
import posiciones.*
import personajes.*

class Palanca {
    var property position = game.center()
    var property image = "palanca_prendida.png"
    var property prendida  = false
    
    method cambiarEstado() {
         if (prendida) {
            image = "palanca_apagada.png"  // Si está encendida, la apagamos
            prendida = false
        } else {
            image = "palanca_prendida.png"  // Si está apagada, la encendemos
            prendida = true
        }
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
