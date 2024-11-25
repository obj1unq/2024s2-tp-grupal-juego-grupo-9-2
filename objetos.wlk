import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*
import mapa.*
import randomizer.*

class Palanca {
    var property position = game.center()
    var property estado  = palancaApagada
    const oceano

    method interactuar(){
       estado = estado.palancaCambiada()
       oceano.cambiar()
    }    
    method image(){
        return estado.image()
    }

    method solida() {
		  return false
    }

    method colision(personaje) {
		  // no queremos que al colisionar haga nada, pero por polimorfismo lo mantenemos
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
    var property position 
    var property image = "monedaDeOro.png"
    var property valor = 10

    method interactuar(){ // Teniendo el metodo "Colision" ya no es importante.
        //pepe.sumarMoneda()
        //game.removeVisual(self)      // no queremos el efecto de colisionar sea a a través de una tecla, pero por polimorfismo lo dejamos.
    }
    
    method solida() {
		return false
	}

    method colision(personaje) {
      personaje.agregarTrofeo(self)
		  personaje.agarrarVisual(self)
    }
}

object estadoNivel{
  const property trofeos = []
}

class MonedaDePlata inherits Moneda(image = "monedaDePlata.png",valor = 50) {
}
class MonedaVioleta inherits Moneda(image = "monedaVioleta.png", valor = 100) {
  override method solida() {
		return true
	}
}
class MonedaDeBronce inherits Moneda(image = "monedaDeBronce.png",valor = 25) {
}
class Roca {
    var property position 
    var property image = "roca-chica.png"

    method solida() {
		return true
	}

    
}

class Leon {
  var property position
  var property estado = leonDormido 

  method image() {
    return estado.image()
  } 

  method solida() {
    return true
  }

  method cambiarEstado(){
       if(estado.dormido()){
        estado = leonDespierto
       }
       else {
        estado = leonDormido
       }
    }

}

object leonDormido {
  method image() {
    return "leon-durmiendo.png"
  }

  method dormido() {
    return true
  } 
}

object leonDespierto {
  method image() {
    return "leon-despierto.png"
  }

  method dormido() {
    return false
  } 
}



class Puente {
    var property position
    var property estado = puenteHabilitado
    method image(){
      return estado.image()
    }
    method solida() = estado.solida()
    method colision(personaje){
      estado.colision()
    }
    method interactuar(){

    }
    method cambiarEstado(){
       if(estado.derrumbado()){
        estado = puenteHabilitado
       }
       else {
        estado = puenteNoHabilitado
       }
    }
}

class PuenteFantasma inherits Puente {
  override method cambiarEstado() {
    if(!estado.derrumbado()) {
      estado = puenteFantasma
    }
  }
}

object puenteFantasma {
  var property image = "fondo-oceano.png" 

  method solida() {
    return false
  }

  method derrumbado() {
    return true
  }

  method colision() {
    
  }
}

object puenteHabilitado {
    var property image = "puente.png"
    var property solida = false
    method derrumbado(){
      return false
    }
    method colision(){

    }
    
}
object puenteNoHabilitado {
    var property image = "puenteRoto.png"
    var property solida = false 
    method derrumbado(){
      return true
    }
    method colision(){  // revisar porque se repite código y hay dos metodos que se llaman igual.
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})   
		  pepe.nivelActual().dibujar()
      game.say(pepe,"¡me ahogué!")
    }
}

class ZonaSegura{
  var property position
  method image() = "zonaSegura.png"
  method solida() = false
  method colision(personaje) { // por polimorfismo
     
  }
  method interactuar() {
    
  }
}

class SueloVidrio{
  var property position
  method image() = "cristal.png"
  method solida() = false
  method colision(personaje){ // por polimorfismo
    
  }

  method interactuar(){
    
  }
}

class SueloVidrioFalso inherits SueloVidrio{
  override method colision(personaje){  // revisar porque se repite código y hay dos metodos que se llaman igual.
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})   
		  nivel1.dibujar()
      game.say(pepe,"¡me ahogué!")
    }
}


class Oceano {
    var property position 
    var property image = "fondo-oceano.png"

    method solida() {
		  return false
	  }

    method colision(personaje) {
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})
		  pepe.nivelActual().dibujar()
      estadoNivel.trofeos().clear()
      //pepe.reinicio()
      game.say(pepe,"me caí al oceano")
    }
}

object oceanoPrendido{ // REVISAR
   var property image = "oceano.png"
   
    method oceanoCambiado(){
        return oceanoApagado
    }
}

object oceanoApagado{ // REVISAR
   var property image = ""
   
    method oceanoCambiado(){
        return oceanoPrendido
    }
}

class Puerta {
    var property position
    var property image = "puertaNueva.png"
    var property nivelADibujar
    var property bgAAgregar = instN1
    const puertaDeNivel = 0

    // method validarPuerta(){
    //     if (not territorio.hayPuertaAca()){
		// 	    self.error("No hay puerta en la posición actual")
		//   }
    // }

    method interactuar() {
      background.dibujo(nivelADibujar)
      background.bgActual(bgAAgregar)   
      background.iniciar()
      pepe.nivelActual(nivelADibujar)
      //game.allVisuals().forEach({elementos => game.removeVisual(elementos)})
      //self.dibujarSiguienteMapa()
    }
    

    method solida() {
		return false
	}

    //method dibujarSiguienteMapa() {
    //  nivel1.dibujar()
    //}

    method colision(personaje){
  
  }
}
class PuertaALobby inherits Puerta(nivelADibujar = lobby) {

  /*override dibujarSiguienteMapa()*/
    override method interactuar() {
      estadoNivel.trofeos().clear()
      game.allVisuals().forEach({bg=>game.removeVisual(bg)}) // no supe como reutilizar el "cambiar" de background
      nivelADibujar.dibujar()
  
    }
}

class PuertaANivel1 inherits Puerta(nivelADibujar = nivel1,bgAAgregar = instN1){

    //method dibujarSiguienteMapa() {
    //  nivel1.dibujar()
    //}

}



class PuertaANivel2 inherits PuertaANivel1(nivelADibujar = nivel2,bgAAgregar =instN2, puertaDeNivel = 2) {
  /*override*/ 
  //method dibujarSiguienteMapa() {
    //pepe.actualizarDolares()
    //nivel2.dibujar()
  //}

  override method interactuar() {
    if(pepe.trofeos().size() >= (puertaDeNivel-1)){
        super()
      }
  }

}


class PuertaANivel3 inherits PuertaANivel2(nivelADibujar = nivel3,bgAAgregar = instN3, puertaDeNivel = 3) {
 //override method dibujarSiguienteMapa() {
 //   nivel3.dibujar()
 // }
}

class PuertaANivel4 inherits PuertaANivel2(nivelADibujar = nivel4,bgAAgregar = instN4, puertaDeNivel = 4)  {
 //override method dibujarSiguienteMapa() {
 //   nivel4.dibujar()
 // }
}

class PuertaANivel5 inherits PuertaANivel2(nivelADibujar = nivel5,bgAAgregar = instN5, puertaDeNivel = 5)  {
 //override method dibujarSiguienteMapa() {
 //   nivel5.dibujar()
      override method interactuar(){
        super()
        game.say(ringo, "Pepite,acá estoy!")
        
      }
 // }
}

class PuertaDeAdorno  { // No la estamos usando pero anda.
  var property position
  var property image = "puertaNueva.png"
  
  
  method solida() {
		return false
	}
}

class Llave {
    var property position
    var property image = "llave.png"


    method interactuar() {
        game.removeVisual(self)
    }

    method solida() {
		return false
	}

  method colision(personaje) {
		  // no queremos que al colisionar haga nada, pero por polimorfismo lo mantenemos
	}
}
class Llave2 inherits Llave(image = "llave2.png") {
  override method solida() {
    return true
  }
}

class NPC {
  var property position
  var property image = "hector.png"


  method solida() { 
		return false
	}

  method interactuar() {
        game.say(self, "¡HOLA VIAJERO!")
    }
  method colision(pepe){
    game.say(self, "¡AUCH!")
  } 
}
object ringo inherits NPC(image = "ringo.png",position = game.center()){
 
  
  override method colision(pepe){
    game.say(self,"Hola pepite te extrañé!")
    game.schedule(3000, {game.allVisuals().forEach({bg=>game.removeVisual(bg)})
                         background.bgActual(bgFinal)
                         background.iniciar()
                          })
                          
  }
}

class Tienda inherits PuertaANivel1(image = "tienda.png",nivelADibujar = mapaTienda,bgAAgregar = bgTienda ){
  //var property position
  //var property image = "tienda.png"


  /*method solida() { //EN EL FUTURO TIENE QUE SER TRUE 
		//return false
	}*/
  override method interactuar(){
  super()
  background.dibujo(lobby)
  
  }
 override  method colision(pepe){
    game.say(self, "Presiona ''z'' para ver tus trofeos")
  } 
}

object sombreroFactory {


  method construir(position) {
    return new Accesorio(position=position)
  }
}


object trofeosFactory {
 
  method construir(position) {
    return new Trofeo(position=position)
  }
}




object administradorSombreros {
 
  const creados = #{}
  const property factories = [sombreroFactory, trofeosFactory]




  method nuevosSombreros() {
    if (self.hayEspacioParaSombrero()) {
      const sombrero = self.construirSombrero()
      game.addVisual(sombrero)
      creados.add(sombrero)
    }else if(self.hayEspacioParaTrofeo()){
      const trofeo = self.construirTrofeos()
      game.addVisual(trofeo)
      creados.add(trofeo)
    }
  }


  method construirSombrero() {
    return sombreroFactory.construir(randomizer.emptyPosition())
  }


  method construirTrofeos() {
    return trofeosFactory.construir(randomizer.emptyPosition())
  }




  method hayEspacioParaSombrero() {
    return creados.size() < 3  and pepe.tieneSombrerosInsuficientes()
  }


  method hayEspacioParaTrofeo() {
    return creados.size() < 1 //and not pepe.tieneTercerTrofeo()
  }




  method remover(accesorio) {
    game.removeVisual(accesorio)
    creados.remove(accesorio)
  }
}
class Accesorio {
  const position
 
  method position() {
    return position
  }


  method image() {
    return "monedaDeOro.png"
  }


  method solida() {
    return false
  }


  method colision(personaje) {
    personaje.agarrarObjeto(self)
  }
}


class Trofeo {
  const position
 
  method position() {
    return position
  }


  method image() {
    return "monedaVioleta.png"
  }


  method solida() {
    return false
  }


  method colision(personaje) {
    personaje.agarrarTrofeo(self)
  }
}


