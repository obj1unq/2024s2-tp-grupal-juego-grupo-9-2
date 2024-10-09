import wollok.game.*
import personajes.*
import objetos.*
object territorio{

     method validarSiHayPalanca(){
      if (not (self.hayPalanca())){
        pepe.error("No hay palanca en la posición actual")
    }
  }
    method hayPalanca(){
      return //   
    }

    method validarDentro(position) {
		if (not self.estaDentro(position)) {
			pepe.error("No puedo moverme fuera del tablero")
		}
	}

    method estaDentro(position) {
		return position.x().between(0, game.width() - 1) and position.y().between(0, game.height() - 1)
	  }
 }

