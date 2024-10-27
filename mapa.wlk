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

object e0 { // representa la Entrada (puerta, etc)

    method dibujarEn(position) {
     game.addVisual(new Puerta0(position = position))
    }
}

object e1 { // representa la Entrada (puerta, etc)

    method dibujarEn(position) {
     game.addVisual(new Puerta1(position = position))
    }
}

object e2 { // representa la Entrada (puerta, etc)

    method dibujarEn(position) {
     game.addVisual(new Puerta2(position = position))
    }
}

object e3 { // representa la Entrada (puerta, etc)

    method dibujarEn(position) {
     game.addVisual(new Puerta3(position = position))
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

object mapa1 {
   
    const property objetosEnTablero = #{}


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,l,l2,_,_],    
     [_,r,r,_,_,_,_,_,_,_,_,_,_],    
     [_,r,p,_,_,_,_,_,_,r,_,e1,_],    
     [_,r,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,m,m2,m3,m4,_,_,_,pa,_],    
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

object mapa2 {
   
    const property objetosEnTablero = #{}


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,r,r,r,r,_,_],    
     [ea,p,_,_,r,r,r,r,_,m,r,_,_],    
     [_,_,_,_,_,_,_,_,_,_,r,_,_],    
     [_,_,_,_,_,_,_,_,r,r,r,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,e2,_],    
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



object mapa3 {


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,o,o,o,o,o,o,o,o,_,_],    
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [ea,p,_,o,m,_,_,_,_,_,_,_,_],    
     [_,_,_,o,o,o,o,o,o,o,o,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,e3,_,_,_,_],    
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


object mapa4 {


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [ea,p,_,o,m,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m2,_,_,_,_,_,_,_,_],    
     [_,_,_,_,m4,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,e0,_,_,_,_],    
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
