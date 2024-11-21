import wollok.game.*

object randomizer {
		
	method position() {
		return 	game.at( 
					(0 .. game.width() - 4 ).anyOne(),
					(0..  game.height() - 1).anyOne()
		) 
	}
	
	method emptyPosition() {
		const position = self.position()
		
		return position 

		/*
		if(game.getObjectsIn(position).isEmpty()) {  // esto es para que aparezca en un lugar vacío.
			return position	
		}
		else {
			return self.emptyPosition()
		}
		*/
	}

	
	
}