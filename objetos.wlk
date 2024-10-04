import wollok.game.*
import posiciones.*

class Palanca {
    var property position = game.center()
    var property image = "Palanca_prendida.png"
    var property prendida  = false
    
    method cambiarEstado() {
         if (prendida) {
            image = "Palanca_apagada.png"  // Si está encendida, la apagamos
            prendida = false
        } else {
            image = "Palanca_prendida.png"  // Si está apagada, la encendemos
            prendida = true
        }
    }
}
