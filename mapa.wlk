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

object u { // Representa una Palanca. pa
    method dibujarEn(position) {
     game.addVisual(new Palanca(position = position, oceano = o))
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
    }
}
object rr {// Representa a ringo
    method dibujarEn(position){
        game.addVisual(ringo)
    }
}

object s{
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
    }
}

object cs{
    method dibujarEn(position){
        game.addVisual(new SueloVidrio(position = position))
    }
}

object cf{
    method dibujarEn(position){
        game.addVisual(new SueloVidrioFalso(position = position))
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
    var dibujo = lobby
    
    method image() = bgActual.image()

    method bgActual(_bgActual){
        bgActual = _bgActual
    }

    method dibujo(_dibujo){
        dibujo = _dibujo
    }

    method iniciar(){
        game.addVisual(self)
    }

    method cambiar(){
        if(bgActual.siguiente() != null){
            
            bgActual = bgActual.siguiente()    
        }else{
            game.allVisuals().forEach({bg=>game.removeVisual(bg)})
            dibujo.dibujar()
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
object instN1{
    method image() = "nivel_1_instrucciones.png"

    method siguiente(){
        return null
    }
}

object instN2{
    method image() = "nivel_2_instrucciones.png"

     method siguiente(){
        return instN22
    }
}

object instN22{
    method image() = "nivel_2_instrucciones2.png"

    method siguiente(){
        return null
    }
}
object instN3{
    method image() = "nivel_3_instrucciones.png"

    method siguiente(){
        return instn32
    }
}
object instn32{
     method image() = "nivel_3_instrucciones2.png"

    method siguiente(){
        return null
    }
}
object instN4{
    method image() = "nivel_4_instrucciones.png"

    method siguiente(){
        return null
    }
}

object instN5{
    method image() = "nivel_5_instrucciones.png"

    method siguiente(){
        return null
    }
}
object bgTienda{
    method image() = "bgTrofeos.png"

    method siguiente(){
        return null
    }
}
object bgNivel5{
    const property position = game.at(0,0)

    method image() = "bgnivel5.png"
    method siguiente() = null
} 
object bgFinal{
    method image() = "bgFinal.png"

    method siguiente() = null
}
object z{  // representa el primer trofe
   
    
    
    //listaDeTrofeos.get(0) // suponiendo que se guarden los trofes es una lista y no un set.
    
}

object zz{  // representa el segundo trofe
    
    //listaDeTrofeos.get(1)
}

object aa{  // representa el tercer trofe
  
    //listaDeTrofeos.get(2)
}
object bb{  // representa el cuarto trofe
    //listaDeTrofeos.get(3)
}

object cc{   // representa el quinto trofe
    //listaDeTrofeos.get(4)
}

object mapaTienda inherits Mapa (tablero = 
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,z,_,zz,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,aa,_,bb,_,_,_,_,_,_],    
     [_,_,_,_,_,_,cc,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse()) 
{

}

object lobby inherits Mapa ( tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,p],
     [_,_,f,_,g,_,i,_,j,_,k,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,h,_,_,_,_,_,_,_,_,_,t,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse())  {
}

object nivel1 inherits Mapa (tablero =  
    [[_,_,_,_,_,_,s,s,_,_,_,p,e],
     [_,_,_,_,_,_,cs,cf,_,_,_,_,_],    
     [_,_,_,_,_,_,s,s,_,_,_,_,_],    
     [_,_,_,_,_,_,cs,cf,_,_,_,_,_],    
     [s,cf,s,cf,s,cs,s,s,_,_,_,_,_],    
     [s,cs,s,cs,s,cf,s,_,_,_,_,_,_],    
     [s,_,_,_,_,_,_,_,_,_,_,_,_],    
     [s,_,_,_,_,_,_,_,_,_,_,_,_],
     [s,cs,s,cf,s,cf,s,cs,s,cs,s,s,s],
     [s,cf,s,cs,s,cs,s,cf,s,cf,s,i,s]        
    ].reverse()) { 
}

object nivel2 inherits Mapa ( tablero =     
    [[o,v,n,n,v,v,v,n,v,v,v,p,e],
     [o,v,o,o,o,o,o,o,o,o,o,o,o],    
     [o,v,o,o,o,o,n,v,v,n,v,o,o],    
     [o,v,n,n,n,v,n,o,o,o,n,m,o],    
     [o,v,o,o,o,o,o,o,o,o,o,o,o],    
     [o,n,n,v,v,v,n,n,v,o,o,o,o],    
     [o,o,o,o,o,o,o,o,n,o,o,o,o],    
     [o,o,v,n,n,v,v,n,v,o,o,v,e],
     [o,o,n,o,o,o,o,o,o,o,o,n,o],
     [o,o,n,v,n,v,n,v,n,v,v,n,o]       
    ].reverse()) {
    
}


object nivel3 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [e,p,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,_,_,_,_,_,_,_,_,_],    
     [_,_,_,o,m,_,_,_,_,_,_,_,_],    
     [_,_,_,o,a,_,_,_,_,_,_,_,_],    
     [_,_,_,_,c,_,_,_,_,_,j,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse() ) {
}

object nivel4 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [e,p,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,l,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,k,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse() ) {
}


object nivel5 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [e,p,_,_,_,_,_,_,_,_,_,f,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,rr],    
     [_,_,_,_,_,_,_,_,q,_,_,_,_],    
     [_,_,_,_,_,_,_,_,b,_,_,_,_],    
     [_,_,_,_,_,_,_,_,c,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse() ) {
}