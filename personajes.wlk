import wollok.game.*
import posiciones.*
import objetos.*
import territorio.*

object pepe {
    var property position = game.center()
    var property image = "Personajes/Pepe/Pepe_de_frente.png"
    var monedas = 0

    method mover(direccion) {
      self.validarMover(direccion)
		  position = direccion.siguiente(self.position())
	  }

    method validarMover(direccion) {
      const siguiente = direccion.siguiente(self.position())
      territorio.validarDentro(siguiente)
	  }
  method activarPalanca(){
        const palanca = new Palanca(position = position) 
        territorio.validarSiHayPalanca()
        palanca.cambiarEstado()

}

    method objetoDebajoDePepe() = game.colliders(self)

    method recogerObjeto() {
        self.validarRecoger()
        const objeto = self.objetoDebajoDePepe().first()
        //game.say(self, "El objeto recogido es de tipo: " + objeto.className())
        self.guardarObjeto(objeto)
        game.removeVisual(objeto)
    }
    method validarRecoger() {
        if (not self.hayObjetoAca()){
            self.error("No hay objeto para recoger!")
        }
    }
    method hayObjetoAca() {
        return not self.objetoDebajoDePepe().isEmpty()
    }
    method guardarObjeto(objeto) {
        if (objeto.className() == "objetos.Moneda"){
          monedas += 1
        }
    }
    method decirMonedas(){
      game.say(self, "Tengo "+monedas+" monedas")
    }

    method colisionasteConPalanca(objecto){
      if (objecto.className() == "objetos.Palanca")
    }
}

