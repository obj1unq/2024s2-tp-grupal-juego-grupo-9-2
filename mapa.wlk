import wollok.game.*
import personajes.*
import posiciones.*
import objetos.*


object _ {

}

object r { // roca

}

object p{ // pepe

}

object mapa {
    const tablero =
    [
     [_,_,_,_,_,_,_,_,_,_],
     [_,_,_,r,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,r,_,_],
     [_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_]
    ]
    
    
    method dibujar() {
        game.height(tablero.size())
        game.width(tablero.get(0).size())

    
    }
}