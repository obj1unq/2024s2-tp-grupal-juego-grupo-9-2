import wollok.game.*
import personajes.*
import objetos.*
object territorio{
    method validarSiHayPalanca(){
    const objetosEnPosicion = game.objectsAt(pepe.position)
    const hayPalanca = objetosEnPosicion.any(it => it instanceof Palanca)

    }
 }

