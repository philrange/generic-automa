class CardsController < ApplicationController
    
    def new 
    end
    
    def create
        @deck = Deck.find(params[:deck_id])
        @card = @deck.cards.create(card_params)
        redirect_to game_deck_path(:id => @deck.id)
    end
    
    def destroy
        @card = Card.find(params[:id])
        deck_id = @card.deck_id
        @card.destroy
        redirect_to game_deck_path(:id => deck_id)
    end
    
    private
    def card_params
      params.require(:card).permit(:card_image)
    end
    
end
