import wollok.game.*


object randomizer {
       
    method position() {
        return  game.at(
                    (1 .. game.width() - 6 ).anyOne(),
                    (0..  game.height() - 1).anyOne()
        )
    }
   
    method emptyPosition() {
        const position = self.position()

        return position
    }
}
