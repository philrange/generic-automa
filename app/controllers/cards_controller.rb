class CardsController < ApplicationController
    
    def new 
    end
    
    def create
        @deck = Deck.find(params[:deck_id])
        @card = @deck.cards.create(card_params)
        redirect_to game_deck_path(:id => @deck.id)
    end
    
    private
    def card_params
      params.require(:card).permit(:card_image)
    end
    
end
