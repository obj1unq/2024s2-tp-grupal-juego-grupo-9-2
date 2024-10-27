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

object m { // representauna moneda - REVISAR 
    method dibujarEn(position) {

        //game.addVisual(new Moneda(position = position))
        //self.guardarObjeto(position)
        //objetosEnTablero.add(position)
   
        const moneda = new Moneda (position = position)
		game.addVisual (moneda)
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
     game.addVisual(new Lobby(position = position))
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

object pa { // Representa una Palanca.
    method dibujarEn(position) {
     game.addVisual(new Palanca(position = position))
    }
}

object o { // Representa el oceano.
    method dibujarEn(position) {
     game.addVisual(new Oceano(position = position))
    }
}

object h { // Representa el oceano.
    method dibujarEn(position) {
     game.addVisual(new NPC(position = position))
    }
}

object t {
    method dibujarEn(position) {
     game.addVisual(new Tienda(position = position))
    }
}


object lobby {
   
    const property objetosEnTablero = #{}


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,n1,_,n2,_,n3,_,n4,_,n5,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,h,_,_,_,_,_,_,_,_,_,t,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,p,_,_,_,_,_,_],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o]        
    ].reverse()


    method dibujar() {
        game.height(tablero.size())
        game.width(tablero.get(0).size())


        (0..game.width() - 1).forEach({ x =>
            (0..game.height() -1).forEach({y =>
                tablero.get(y).get(x).dibujarEn(game.at(x,y))
            })
        })
       //game.addVisual(pepe) //Lo pongo aca por el eje z




    }

}

object nivel1 {
   
    const property objetosEnTablero = #{}


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,r,r,r,r,_,_],    
     [_,_,_,_,r,r,r,r,_,lo,r,_,_],    
     [_,_,_,_,_,_,m,m2,_,_,r,_,_],    
     [_,_,_,_,_,r,r,r,r,r,r,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()


    method dibujar() {
         
        game.ground("fondo-uno.jpeg")   // Creo que no puedo cambiar el fondo porque no tiene las mismas dimensiones. 

        game.height(tablero.size())
        game.width(tablero.get(0).size())

       

        (0..game.width() - 1).forEach({ x =>
            (0..game.height() -1).forEach({y =>
                tablero.get(y).get(x).dibujarEn(game.at(x,y))
            })
        })
        // game.addVisual(pepe) //Lo pongo aca por el eje z
       
    }
}



object nivel2 {


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,o,o,o,o,o,o,o,o,_,_],    
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m,_,_,_,_,_,_,_,_],    
     [_,_,_,o,o,o,o,o,o,o,o,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,lo,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()


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


object nivel3 {


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m2,_,_,_,_,_,_,_,_],    
     [_,_,_,_,m4,_,_,_,_,_,lo,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()


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

object nivel4 {


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,l,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,lo,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()


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


object nivel5 {


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [lo,p,_,_,_,_,_,_,_,_,_,lo,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,l2,_,_,_,_],    
     [_,_,_,_,_,_,_,_,m3,_,_,_,_],    
     [_,_,_,_,_,_,_,_,m4,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()


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