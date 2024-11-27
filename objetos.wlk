import territorio.*
import wollok.game.*
import posiciones.*
import personajes.*
import mapa.*
import randomizer.*


// ---------- MONEDA / TROFEOS ----------
class Moneda {
  var property position 
  var property image

  method solida() {
    return false
  }

  method colision(personaje) {
    personaje.agregarTrofeo(self)
    personaje.agarrarVisual(self)
    bgTienda.estado()
    game.sound("pickUp.mp3").play()
  }
}

class MonedaDeOro inherits Moneda(image = "monedaDeOro.png") {
  
  override method colision(personaje) {
    super(personaje)
    administradorSombreros.remover(self) 
  }

}
class MonedaDePlata inherits Moneda(image = "monedaDePlata.png") {
}
class MonedaVioleta inherits Moneda(image = "monedaVioleta.png") {
}
class MonedaDeBronce inherits Moneda(image = "monedaDeBronce.png") {
}

// ---------- ROCA ----------
class Roca {
  var property position 
  var property image = "roca-chica.png"

  method solida() {
    return true
  }
}

// ---------- LEON ----------
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
    estado = estado.siguiente()
  }
}
// --- estado del LEON ---
object leonDormido {

  method image() {
    return "leon-durmiendo.png"
  }

  method siguiente() {
    return leonDespierto
  } 
}

object leonDespierto {

  method image() {
    return "leon-despierto.png"
  }

  method siguiente() {
    return leonDormido
  } 
}

// ---------- SUELO ----------

class Superficie{
  var property position 
  var property image

  method solida() = false

  method colision(personaje) { // por polimorfismo
     
  }
  method interactuar() {
    
  }
}

// --- superficies nivel 1 ---
class ZonaSegura inherits Superficie(image = "zonaSegura.png"){
}
class SueloVidrio inherits Superficie(image = "cristal.png"){
}
class SueloVidrioFalso inherits SueloVidrio{
  override method colision(personaje){  // revisar porque se repite código y hay dos metodos que se llaman igual.
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})   
		  nivel1.dibujar()
      game.say(pepe,"¡me ahogué!")
    }
}
// --- superficie leon ---
class SueloLeon inherits Superficie (image = "vacio.png"){
    var property estado = leonNoAlerta

    override method colision(personaje){
      estado.colision()
    }

    method cambiarEstado(){
      estado = estado.siguiente()
    }
}
// - estados de superficie leon -
object leonNoAlerta {
    method siguiente(){
      return leonAlerta
    }

    method colision(){

    }
}
object leonAlerta {
    method siguiente(){
      return leonNoAlerta
    }
    method colision(){  // revisar porque se repite código y hay dos metodos que se llaman igual.
      self.limpiarListasPorPerder()
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})
		  pepe.nivelActual().dibujar()
      game.say(pepe,"¡Me comió el leon!")
    }

    method limpiarListasPorPerder() {
      administradorSombreros.creados().clear()
      pepe.cantSombreros(0) 
    }
}

// ---------- OCEANO ---------
class Oceano inherits SueloLeon{

    override method colision(personaje) {
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})
		  pepe.nivelActual().dibujar()
      game.sound("scream.mp3").play()
      game.say(pepe,"me caí al oceano")
    }
}

class Pescado inherits Oceano {
  override method image() = "pescado.png"
}

class Tiburon inherits Oceano {
  override method image() = "tiburon.png"
}

// --- puente para nivel 2 y 4 ---
class Puente{
  var property position
  var property estado = puenteHabilitado

  method image() {
    return estado.image()
  }


    method solida() = estado.solida()

    method colision(personaje){
      estado.colision()
    }

    method cambiarEstado(){
       estado = estado.siguiente()
       estado.iniciar(self)
    }
}


// --- estados de puente (nivel 2) ---
class PuenteHabilitado {
    const property image = "puente.png"
    const property solida = false


    method siguiente()
    
    method colision(){

    }

    method iniciar(puente) {

    }
}
class PuenteNoHabilitado {
  const property image = "puenteRoto.png"
  const property solida = false

    method siguiente()

    method iniciar(puente) {
      if(puente.position() == pepe.position()) {
        game.schedule(500, {puente.colision(pepe)})  
      }
    }

    method colision(){  // revisar porque se repite código y hay dos metodos que se llaman igual.
      game.allVisuals().forEach({elementos => game.removeVisual(elementos)})   
		  pepe.nivelActual().dibujar()
      game.say(pepe,"¡me ahogué!")
    }

     
    
}
object puenteHabilitado inherits PuenteHabilitado {

  override method siguiente(){
    return puenteNoHabilitado
  }

}
object puenteNoHabilitado inherits PuenteNoHabilitado { 
    override method siguiente(){
      return puenteHabilitado
    }

}

// --- estados de puente fantasma (nivel 4) ---
class PuenteFantasma inherits Puente (estado = puenteHabilitadoFantasma) {
  
}
object puenteHabilitadoFantasma inherits PuenteHabilitado  {
  override method siguiente(){
      return puenteFantasma
    }
}

object puenteFantasma inherits PuenteHabilitado (image = "vacio.png" ){

  override method siguiente() {
    return puenteHabilitadoFantasma
  }

}



// ---------- PUERTAS ----------
class Puerta {
  var property position
  var property image 
  var property nivelADibujar
  var property bgAAgregar = instN1
  const puertaDeNivel = 0


  method interactuar() {
    background.dibujo(nivelADibujar)
    background.bgActual(bgAAgregar)   
    background.iniciar()
    pepe.nivelActual(nivelADibujar)
    game.sound("openDoor.mp3").play() 
  }

  method solida() {
    return false
  }

  method colision(personaje){ // Por porlimorfismo

  }
}
class PuertaALobby inherits Puerta(nivelADibujar = lobby, image = "puertaDeLobby.png") {
  override method interactuar() {
    game.allVisuals().forEach({bg=>game.removeVisual(bg)}) // no supe como reutilizar el "cambiar" de background
    game.removeTickEvent("estado")
    nivelADibujar.dibujar()
  }
}

class PuertaANivel1 inherits Puerta(nivelADibujar = nivel1,bgAAgregar = instN1, image = "puertaDeNivel1.png"){
}
class PuertaANivel2 inherits PuertaANivel1(nivelADibujar = nivel2,bgAAgregar =instN2, puertaDeNivel = 2, image = "puertaDeNivel2.png") {
  override method interactuar() {
    if(pepe.trofeos().size() >= (puertaDeNivel-1)){
        super()
      } else {
        game.say(pepe,"Necesito el Trofeo del nivel anterior.")
      }
  }
}

class PuertaANivel3 inherits PuertaANivel2(nivelADibujar = nivel3,bgAAgregar = instN3, puertaDeNivel = 3, image = "puertaDeNivel3.png") {
}

class PuertaANivel4 inherits PuertaANivel2(nivelADibujar = nivel4,bgAAgregar = instN4, puertaDeNivel = 4, image = "puertaDeNivel4.png")  {
}

class PuertaANivel5 inherits PuertaANivel2(nivelADibujar = nivel5,bgAAgregar = instN5, puertaDeNivel = 5, image = "puertaDeNivel5.png")  {
}


// ---------- TIENDA ----------

class Tienda inherits PuertaANivel1(image = "tienda.png",bgAAgregar = bgTienda ){
  
  override method interactuar(){
    super()
    background.dibujo(lobby)
  }

  override  method colision(pepe){
    game.say(self, "Presiona ''z'' para ver tus trofeos")
  } 
}

// ---------- SOMBREROS ----------

object sombreroFactory {


  method construir(position) {
    return new Sombrero(position=position)
  }
}


object monedaFactory {
 
  method construir(position) {
    return new MonedaDeOro(position=position)
  }
}




object administradorSombreros {
 
  const property creados = #{}
  const property factories = [sombreroFactory, monedaFactory]




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
    return monedaFactory.construir(randomizer.emptyPosition())
  }




  method hayEspacioParaSombrero() {
    return creados.size() < 3  and pepe.tieneSombrerosInsuficientes()
  }


  method hayEspacioParaTrofeo() {
    return creados.size() < 1 and not pepe.tieneMasDeDosTrofeos()
  }



  method remover(accesorio) {
    game.removeVisual(accesorio)
    creados.remove(accesorio)
  }
}
class Sombrero {
  const position
 
  method position() {
    return position
  }


  method image() {
    return "sombrero.png"
  }


  method solida() {
    return false
  }


  method colision(personaje) {
    personaje.agarrarObjeto(self)
    game.sound("pickUp.mp3").play()
  }
}



class BarreraInvisible {
  var property position 
  var property image = "vacio.png" 

  method solida() {
    return true
  }
}

