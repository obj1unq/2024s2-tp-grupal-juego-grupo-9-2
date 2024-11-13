import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*
import personajes.*




object _ {
    method dibujarEn(position) {
    }
}


object p {  // representa a Pepe en el mapa.

    method dibujarEn(position) {
        pepe.position(position)
        game.addVisual(pepe)
    }
}

object r { // representa una roca.
    method dibujarEn(position) {
     game.addVisual(new Roca(position = position))
    }
}

object m { // representauna moneda.
    method dibujarEn(position) {
     game.addVisual(new Moneda(position = position))
    }
}

object m2 { // representa una moneda de plata.
    method dibujarEn(position) {
     game.addVisual(new MonedaDePlata(position = position))
    }
}

object m3 { // representa una moneda de bronce.
    method dibujarEn(position) {
     game.addVisual(new MonedaDeBronce(position = position))
    }
}

object m4 { // representa una moneda violeta .
    method dibujarEn(position) {
     game.addVisual(new MonedaVioleta(position = position))
    }
}

object ea {  // representa la entrada de adorno en el mapa.

    method dibujarEn(position) {
        game.addVisual(new PuertaDeAdorno(position = position)) //primero poner la puerta luego a Pepe, porque sino no funciona.
    }
}

object lo { // representa el lobby 

    method dibujarEn(position) {
     game.addVisual(new PuertaALobby(position = position))
    }
}

object n1 { // representa la entrada al Nivel 1 

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel1(position = position))
    }
}

object n2 { // representa la entrada al Nivel 2 

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel2(position = position))
    }
}

object n3 { // representa la entrada al Nivel 3 

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel3(position = position))
    }
}

object n4 { // representa la entrada al Nivel 4

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel4(position = position))
    }
}

object n5 { // representa la entrada al Nivel 5

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel5(position = position))
    }
}

object l { // Representa una llave.
    method dibujarEn(position) {
     game.addVisual(new Llave(position = position))
    }
}

object l2 { // Representa una llave.
    method dibujarEn(position) {
     game.addVisual(new Llave2(position = position))
    }
}

object o { // Representa el oceano.
    method dibujarEn(position) {
     game.addVisual(new Oceano(position = position))
    }
}

object o1 { // Representa el oceano.
    method dibujarEn(position) {
     game.addVisual(new OceanoP1(position = position))
    }
}

object pa { // Representa una Palanca.
    method dibujarEn(position) {
     game.addVisual(new Palanca(position = position, oceano = o1))
    }
}



object h { // Representa a Hector.
    method dibujarEn(position) {
     game.addVisual(new NPC(position = position))
    }
}

object t { // Representa una Tienda.
    method dibujarEn(position) {
     game.addVisual(new Tienda(position = position))
    }
}

object pu {
    method dibujarEn(position){
        game.addVisual(new Puente(position = position))
    }
}

class Mapa {
    const tablero 

    method dibujar() {
        game.height(tablero.size())
        game.width(tablero.get(0).size())


        (0..game.width() - 1).forEach({ x =>
            (0..game.height() -1).forEach({y =>
                tablero.get(y).get(x).dibujarEn(game.at(x,y))
            })
        })
    }
}
class Background inherits Mapa(tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()){
   var property nuevoMapa 
    method image() 

    override method dibujar(){
        super()
        game.boardGround(self.image())
    }

    method cambiar(){
        nuevoMapa.dibujar()
    }        
    
}
object start inherits Background(nuevoMapa = inst){
    override method image() = "inicio.png"

}
object inst inherits Background(nuevoMapa = lobby){
    override method image() = "instrucciones.png"

}



object lobby inherits Mapa ( tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,n1,_,n2,_,n3,_,n4,_,n5,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,h,_,_,_,_,_,_,_,_,_,t,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,p,_,_,_,_,_,_],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o]        
    ].reverse())  {
        method image() = "puenteD.png"

        override method dibujar(){
        super()
        game.boardGround(self.image())
    }
}

object nivel1 inherits Mapa (tablero =  
    [[o,o,o,o,o,o,o,o,o,o,o,o,o],
     [lo,p,_,pa,o,o,o,o,o,o,o,o,o],    
     [o,o,o1,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,_,o,o,o,o,o,o,o,o,o,o],    
     [o,o,m,_,m2,_,_,lo,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o]        
    ].reverse()) { 
}

object nivel2 inherits Mapa ( tablero =     
    [[o,o,o,o,o,o,o,o,o,o,o,o,o],
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [pu,o,o,o,o,o,o,o,o,o,o,o,o],    
     [p,o,o,o,o,o,o,o,o,o,o,o,o],    
     [lo,o,o,o,o,o,o,o,o,o,o,o,o]       
    ].reverse()) {
}


object nivel3 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m2,_,_,_,_,_,_,_,_],    
     [_,_,_,_,m4,_,_,_,_,_,n4,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse() ) {
}

object nivel4 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,l,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,n5,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse() ) {
}


object nivel5 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,_,_,_,_,_,_,_,_,n1,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,l2,_,_,_,_],    
     [_,_,_,_,_,_,_,_,m3,_,_,_,_],    
     [_,_,_,_,_,_,_,_,m4,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse() ) {
}