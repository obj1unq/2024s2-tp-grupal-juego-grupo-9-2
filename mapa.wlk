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
    //Precondicion: no puede haber "p" y "k" en el mismo mapa.

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

object m { // REVISAR 
    const property objetosEnTablero = #{}
    method dibujarEn(position) {

        game.addVisual(new Moneda(position = position))
        self.guardarObjeto(position)
   
   
        //const moneda = new Moneda (position = position)
		//game.addVisual (Moneda)
        //objetosEnTablero.add(Moneda)
    
    }

    method guardarObjeto(objeto) {
        objetosEnTablero.add(objeto)
    }

}

object k {  // representa a Pepe con una puerta en el mapa. (en la misma celda).
    //Precondicion: no puede haber "p" y "k" en el mismo mapa.

    method dibujarEn(position) {

        game.addVisual(new Puerta(position = position)) //primero poner la puerta luego a Pepe, porque sino no funciona.
        pepe.position(position)
        game.addVisual(pepe)
    }
}

object e { // representa la Entrada (puerta, etc)

    method dibujarEn(position) {
     game.addVisual(new Puerta(position = position))
    }
}

object l { // Representa una llave.
    method dibujarEn(position) {
     game.addVisual(new Llave(position = position))
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

object mapa {
   
    const property objetosEnTablero = #{}


    const tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,m,_,pa,_,l,_,_,_],    
     [_,r,r,_,_,_,_,_,_,_,_,_,_],    
     [_,r,p,_,_,_,_,_,_,r,_,e,_],    
     [_,r,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,m,_,m,_,_,_,_,_,_],    
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
     [_,_,_,_,_,_,_,r,r,r,_,_,_],    
     [_,k,_,_,r,r,r,r,_,m,r,_,_],    
     [_,_,_,_,_,_,_,_,_,_,r,_,_],    
     [_,_,_,_,_,_,_,_,r,r,r,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()


    method dibujar() {
        game.height(tablero.size())
        game.width(tablero.get(0).size())

        game.ground("fondo-uno.jpeg")   // Creo que no puedo cambiar el fondo porque no tiene las mismas dimensiones. 

        (0..game.width() - 1).forEach({ x =>
            (0..game.height() -1).forEach({y =>
                tablero.get(y).get(x).dibujarEn(game.at(x,y))
            })
        })
        // game.addVisual(pepe) //Lo pongo aca por el eje z
       
    }
}