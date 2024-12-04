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
    }
}

object r { // representa una roca con zona segura
    method dibujarEn(position) {
        const roca = new Roca(position = position)
        game.addVisual(new ZonaSegura(position = position))
        game.addVisual(roca)
        game.schedule(7000, {game.removeVisual(roca)})
    }
}

object e { // representa el lobby.

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


object o { // Representa el oceano.
    method dibujarEn(position) {
     game.addVisual(new Oceano(position = position))
    }
}


object h { // Representa a Hector.
    method dibujarEn(position) {
     game.addVisual(new Hector(position = position))
    }
}

object t { // Representa una Tienda.
    method dibujarEn(position) {
     game.addVisual(new Tienda(position = position))
    }
}


object v {  // Representa un Puente.
    method dibujarEn(position){
        game.addVisual(new Puente(position = position))
    }
}

object vm {  // Representa un Puente con moneda
    method dibujarEn(position){
        game.addVisual(new Puente(position = position))
        if(pepe.trofeos().size() < 2){
            game.addVisual(new MonedaDePlata(position = position))
        }
    }
}

object n {// Representa un Puente que se desarma cada x tiempo
    method dibujarEn(position){
        const puente = new Puente(position = position)
        game.addVisual(puente)
	    game.onTick(4000, "estado", {puente.cambiarEstado()})
//      "estado" + self.identity()  / + puente.identity()
    }
}

object n2 {// Representa un Puente que se desarma cada x tiempo
    method dibujarEn(position){
        const puente = new PuenteFantasma(position = position)
        game.addVisual(puente)
        game.schedule(7000, {puente.cambiarEstado()})
    }
}

object n3 {// Representa un Puente que se desarma cada x tiempo
    method dibujarEn(position){
        const sueloLeon = new SueloLeon(position = position)
        game.addVisual(sueloLeon)
	    game.onTick(5000, "estado", {sueloLeon.cambiarEstado()})
    }
}

object rr {// Representa a ringo
    method dibujarEn(position){
        game.addVisual(new Ringo (position = position))
    }
}

object s { // Representa una zona segura. 
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
    }
}

object sm { // Representa una zona segura con una moneda
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        if(pepe.trofeos().size() < 1){
            game.addVisual(new MonedaDeBronce(position = position))
        }
    }
}

object sc { // Representa una zona segura con una moneda
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        if(pepe.trofeos().size() < 4){
            game.addVisual(new MonedaVioleta(position = position))
        }


    }
}

object sp { // Representa una zona segura con una puerta al lobby y pepe.
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        game.addVisual(new PuertaALobby(position = position))
        pepe.position(position)
    }
}

object sg { // Representa una zona segura con una puerta al segundo nivel.
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        game.addVisual(new PuertaANivel2(position = position))
    }
}

object si { // Representa una zona segura con una puerta al segundo nivel.
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        game.addVisual(new PuertaANivel3(position = position))
    }
}

object sj { // Representa una zona segura con una puerta al segundo nivel.
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        game.addVisual(new PuertaANivel4(position = position))
    }
}

object sk {
    method dibujarEn(position){
        game.addVisual(new ZonaSegura(position = position))
        game.addVisual(new PuertaANivel5(position = position))
    }
}

object cs{ // Representa Suelo de Vidrio.
    method dibujarEn(position){
        game.addVisual(new SueloVidrio(position = position))
    }
}

object cf{ // Representa Suelo de Vidrio falso.
    method dibujarEn(position){
        game.addVisual(new SueloVidrioFalso(position = position))
    }
}

object l { // Representa un leon.
    method dibujarEn(position){
        const leon = new Leon(position = position)
        game.addVisual(leon)
	    game.onTick(5000, "estado", {leon.cambiarEstado()})
    }
}

object bi { // Representa una barrera invisible.
    method dibujarEn(position){
        game.addVisual(new BarreraInvisible(position = position))
    }
}

object ap { // Representa un Pescado.
    method dibujarEn(position){
        game.addVisual(new Pescado(position = position))
    }
}

object at { // Representa un Tiburon.
    method dibujarEn(position){
        game.addVisual(new Tiburon(position = position))
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
    var property image = "bgTienda00.png"

    method estado() {
        if (pepe.cantidadDeTrofeos() >= 1 && pepe.cantidadDeTrofeos() <= 4) {
            self.image("tiendaNivel" + pepe.cantidadDeTrofeos() + ".png")
        }
    }

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
            game.removeTickEvent("estado")
            dibujo.dibujar()
        }
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
//      game.boardGround(fondo.image())
        game.addVisual(pepe) // Ponemos acá la visual de Pepe para que esté arriba de todas las visuales.
    }
}


object lobby inherits Mapa ( tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,f,_,g,_,i,_,j,_,k,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,h,_,_,_,_,_,_,_,_,_],    
     [_,t,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,p,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_]        
    ].reverse())  {

    
}

object nivel1 inherits Mapa (tablero =  
    [[o ,o ,o ,o ,o ,o ,o ,s ,s ,cf,s ,sp,s ],
     [o ,o ,o ,o ,o ,o ,o ,s ,s ,cs,s ,s ,s ],    
     [o ,o ,o ,o ,o ,o ,o ,s ,s ,o ,o ,o ,o ],    
     [o ,o ,o ,o ,o ,o ,o ,cf,cs,o ,o ,o ,o ],    
     [s ,cf,s ,cf,s ,cs,s ,s ,s ,o ,o ,o ,o ],    
     [s ,cs,s ,cs,s ,cf,s ,s ,s ,o ,o ,sm,o ],    
     [s ,o ,o ,o ,o ,o ,o ,o ,o ,o ,s ,s ,s ],    
     [s ,o ,o ,o ,o ,o ,o ,o ,o ,o ,cf,cf,cs],
     [s ,cs,s ,cf,s ,cf,s ,cs,s ,cs,s ,s ,s ],
     [s ,cf,s ,cs,s ,cs,s ,cf,s ,cf,s ,sg,s ]        
    ].reverse()) { 

    
}

object nivel2 inherits Mapa ( tablero =     

    [[o ,v ,n ,n ,v ,v ,v ,n ,v ,v ,v ,v ,sp],
     [o ,v ,o ,o ,o ,o ,o ,o ,o ,o ,o ,o ,o ],    
     [o ,v ,o ,o ,o ,o ,n ,v ,v ,n ,v ,o ,o ],    
     [o ,n ,n ,n ,n ,v ,n ,o ,o ,o ,n ,v ,o ],    
     [o ,o ,o ,o ,o ,o ,o ,o ,o ,o ,o ,n ,o ],    
     [o ,n ,n ,v ,v ,n ,n ,v ,v ,n ,v ,v ,o ],    
     [o ,n ,o ,o ,o ,o ,o ,o ,o ,o ,o ,o ,o ],    
     [o ,n ,o ,n ,n ,n ,o ,n ,n ,n ,o ,v ,si],
     [o ,v ,o ,v ,o ,n ,o ,v ,o ,n ,o ,v ,o ],
     [o ,n ,n ,v ,o ,v ,n ,v ,o, v, v, n ,vm]       

    ].reverse()) {

    
    
}


object nivel3 inherits Mapa (tablero =
    [[bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,sj],
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],    
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],    
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],    
     [l ,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],    
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],    
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],    
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,s ],
     [bi,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,n3,sp]      
    ].reverse() ) {


    override method dibujar() {
        super()
        game.onTick(5000, "sombreros", {administradorSombreros.nuevosSombreros()})
    }
}


object nivel4 inherits Mapa (tablero =
    [[sk,o ,n2,n2,n2,o ,o ,o ,o ,o ,r ,s ,s ],
     [sc,o ,n2,o ,n2,o ,n2,n2,n2,o ,r ,s ,s ],    
     [n2,n2,n2,o ,n2,o ,n2,o ,n2,o ,r ,s ,s ],    
     [o ,o ,o ,at,n2,o ,n2,o ,n2,n2,r ,s ,s ],    
     [n2,n2,n2,n2,n2,o ,n2,o ,o ,o ,r ,s ,sp],    
     [n2,o ,o ,o ,o ,o ,n2,o ,o ,o ,r ,s ,s ],    
     [n2,n2,n2,o ,o ,o ,n2,o ,o ,o ,r ,s ,s ],    
     [o ,o ,n2,n2,o ,o ,n2,n2,n2,o ,r ,s ,s ],
     [o ,at,o ,n2,n2,o ,o ,ap,n2,o ,r ,s ,s ],
     [o ,o ,o ,o ,n2,n2,n2,n2,n2,o ,r ,s ,s ]      
    ].reverse() ) {
    
}



object nivel5 inherits Mapa (tablero =
    [[_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,rr,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],    
     [_,_,_,_,_,_,_,_,_,_,_,_,_],
     [_,_,_,_,_,_,p,_,_,_,_,_,_],
     [_,_,_,_,_,_,e,_,_,_,_,_,_]        
    ].reverse() ) {
    
}