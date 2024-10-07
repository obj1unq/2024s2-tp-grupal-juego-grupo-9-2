import wollok.game.*
import posiciones.*

class Palanca {
    var property position = game.center()
    var property image = "Objetos/Palanca_prendida.png"
    var property prendida  = false
    
    method cambiarEstado() {
         if (prendida) {
            image = "Objetos/Palanca_apagada.png"  // Si está encendida, la apagamos
            prendida = false
        } else {
            image = "Objetos/Palanca_prendida.png"  // Si está apagada, la encendemos
            prendida = true
        }
    }
}

class Moneda {
    var property position = game.center()
    var property image = "Objetos/Roca-chica.png"
    
}
