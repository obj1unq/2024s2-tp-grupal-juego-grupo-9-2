import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*
import personajes.*




object _ {
    method dibujarEn(position) { //vacío
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

object a { // representa una moneda de plata. m2
    method dibujarEn(position) {
     game.addVisual(new MonedaDePlata(position = position))
    }
}

object b { // representa una moneda de bronce. m3
    method dibujarEn(position) {
     game.addVisual(new MonedaDeBronce(position = position))
    }
}

object c { // representa una moneda violeta . m4
    method dibujarEn(position) {
     game.addVisual(new MonedaVioleta(position = position))
    }
}

object d {  // representa la entrada de adorno en el mapa. ea

    method dibujarEn(position) {
        game.addVisual(new PuertaDeAdorno(position = position)) //primero poner la puerta luego a Pepe, porque sino no funciona.
    }
}

object e { // representa el lobby lo

    method dibujarEn(position) {
     game.addVisual(new PuertaALobby(position = position))
    }
}

object f { // representa la entrada al Nivel 1 f 

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel1(position = position))
    }
}

object g { // representa la entrada al Nivel 2  g

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel2(position = position))
    }
}

object i { // representa la entrada al Nivel 3 i 

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel3(position = position))
    }
}

object j { // representa la entrada al Nivel 4 j

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel4(position = position))
    }
}

object k { // representa la entrada al Nivel 5

    method dibujarEn(position) {
     game.addVisual(new PuertaANivel5(position = position))
    }
}

object l { // Representa una llave. 
    method dibujarEn(position) {
     game.addVisual(new Llave(position = position))
    }
}

object q { // Representa una llave. q
    method dibujarEn(position) {
     game.addVisual(new Llave2(position = position))
    }
}

object o { // Representa el oceano.
    method dibujarEn(position) {
     game.addVisual(new Oceano(position = position))
    }
}


object s { // Representa el oceano que cambia con palanca1. s
    method dibujarEn(position) {
     game.addVisual(new OceanoFalso(position = position, palanca = u))
    }
}

object u { // Representa una Palanca. pa
    method dibujarEn(position) {
     game.addVisual(new Palanca(position = position, oceano = s))
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


object v {  // Representa un Puente pu
    method dibujarEn(position){
        game.addVisual(new Puente(position = position))
    }
}

object n {// Representa un Puente que se desarma cada x tiempo
    method dibujarEn(position){
        const puente = new PuenteFragil(position = position)
        game.addVisual(puente)
	    game.onTick(5000, "estado", {puente.cambiarEstado()})
        //game.onTick(8500, "estado", {puente.cambiarEstado()})
    }
}

object n2 {// Representa un Puente que se desarma cada x tiempo
    method dibujarEn(position){
        const puente = new PuenteFragil(position = position)
        game.addVisual(puente)
	    game.onTick(5000, "estado", {puente.desaparecerPuente()})
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
object background {
   var property bgActual = start     // inst o lobby
    const property position = game.at(0,0)
    method image() = bgActual.image()

    method iniciar(){
        game.addVisual(self)
    }

    method cambiar(){
        if(bgActual.siguiente() != null){
            
            bgActual = bgActual.siguiente()    
        }else{
            game.allVisuals().forEach({bg=>game.removeVisual(bg)})
            lobby.dibujar()
            game.onTick(3000, "lamparitas", {administradorLamparas.nuevaLamparita()})
        }
    }        
}
object start {
     method image() = "instrucciones.png"

    method siguiente(){
        return inst
    }
}
object inst {
     method image() = "inicio.png"

     method siguiente(){
        return null
    }
   

}



object lobby inherits Mapa ( tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,p],
     [_,_,f,_,g,_,i,_,j,_,k,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,h,_,_,_,_,_,_,_,_,_,t,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [v,v,v,v,v,v,v,v,v,v,v,v,v],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse())  {
}

object nivel1 inherits Mapa (tablero =  
    [[o,o,o,o,o,o,o,o,o,o,o,o,o],
     [e,p,_,u,o,o,o,o,o,o,o,o,o],    
     [o,o,s,o,o,o,o,o,o,o,o,o,o],    
     [o,o,s,o,o,o,o,o,o,o,o,o,o],    
     [o,o,s,o,o,o,o,o,o,o,o,o,o],    
     [o,o,_,o,o,o,o,o,o,o,o,o,o],    
     [o,o,m,_,a,_,_,a,o,o,o,o,o],    
     [o,o,o,o,o,o,o,o,o,o,o,o,o],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()) { 
}

object nivel2 inherits Mapa ( tablero =     
    [[o,v,n,n,v,v,v,n,v,v,v,p,e],
     [o,v,o,o,o,o,o,o,o,o,o,o,o],    
     [o,v,o,o,o,o,n,v,v,n,o,o,o],    
     [o,v,v,n,v,o,n,o,o,v,o,o,o],    
     [o,o,o,o,v,o,v,o,o,v,o,o,o],    
     [n,n,n,v,v,o,v,o,o,n,o,o,o],    
     [v,o,o,o,o,o,v,o,o,v,o,o,o],    
     [v,v,v,v,v,n,v,o,o,v,n,v,e],
     [o,v,o,o,o,o,o,o,o,o,o,o,o],
     [o,o,o,o,o,o,o,o,o,o,o,o,o]       
    ].reverse()) {
    
}


object nivel3 inherits Mapa (tablero =
    [[v,n,n,n,v,n,n,n,v,v,n,_,_],
     [n,v,v,n,n,v,n,v,v,n,n,p,e],    
     [n,v,n,n,v,v,n,n,v,n,v,_,_],    
     [v,n,v,v,n,n,v,n,n,v,n,_,_],    
     [v,n,n,n,v,n,v,v,n,n,v,_,_],    
     [n,v,v,v,n,n,n,n,v,v,n,_,_],    
     [v,n,n,n,v,n,v,v,n,v,n,_,_],    
     [n,v,v,n,n,v,n,n,n,n,v,_,_],
     [v,n,n,v,v,n,n,n,v,v,n,_,_],
     [v,n,v,v,n,v,n,v,n,v,n,_,_]      
    ].reverse() ) {

    override method dibujar() {
        super()
        game.onTick(5000, "lamparitas", {administradorAccesorios.nuevosAccesorios()})
    }
}

object nivel4 inherits Mapa (tablero =
    [[_,n,n,n,n,n,n,n,n,n,n,_,_],
     [_,n,n,n,n,n,n,n,n,n,n,p,e],    
     [_,n,n,n,n,n,n,n,n,n,n,_,_],    
     [_,n,n,n,n,n,n,n,n,n,n,_,_],    
     [_,n,n,n,n,n,n,n,n,n,n,_,_],    
     [_,n,n,n,n,n,n,n,n,n,n,_,_],    
     [_,n,n,n,n,n,n,n,n,n,n,_,_],    
     [_,n,n,n,n,n,n,n,n,n,n,_,_],
     [_,n,n,n,n,n,n,n,n,n,n,_,_],
     [_,n,n,n,n,n,n,n,n,n,n,_,_]      
    ].reverse() ) {

    override method dibujar() {
        super()
        game.onTick(5000, "lamparitas", {administradorAccesorios.nuevosAccesorios()})
    }
}


object nivel5 inherits Mapa (tablero =
    [[_ ,o ,n2,n2,n2,o ,o ,o ,o ,o ,_ ,_ ,_ ],
     [_ ,o ,n2,o ,n2,o ,n2,n2,n2,o ,_ ,p ,e ],    
     [_ ,n2,n2,o ,n2,o ,n2,o ,n2,o ,_ ,_ ,_ ],    
     [_ ,o ,o ,o ,n2,o ,n2,o ,n2,n2,_ ,_ ,_ ],    
     [m ,o ,n2,n2,n2,o ,n2,o ,o ,o ,_ ,_ ,_ ],    
     [_ ,o ,n2,o ,o ,o ,n2,o ,o ,o ,_ ,_ ,_ ],    
     [_ ,o ,n2,o ,o ,o ,n2,o ,o ,o ,_ ,_ ,_ ],    
     [_ ,o ,n2,n2,o ,o ,n2,n2,n2,o ,_ ,_ ,_ ],
     [_ ,o ,o ,n2,n2,o ,o ,o ,n2,o ,_ ,_ ,_ ],
     [_ ,o ,o ,o ,n2,n2,n2,n2,n2,o ,_ ,_ ,_ ]      
    ].reverse() ) {
}