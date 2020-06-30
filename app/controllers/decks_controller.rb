class DecksController < ApplicationController
    
    def new 
    end
    
    def create
        @game = Game.find(params[:game_id])
        @deck = @game.decks.create(deck_params)
        redirect_to game_path(@game)
    end
    
    def show
        @deck = Deck.find(params[:id])    
    end
    
    private
    def deck_params
      params.require(:deck).permit(:name)
    end
    
end
