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
    
    def destroy
        @game = Game.find(params[:game_id])  
        @deck = Deck.find(params[:id])  
        
        deck_in_use = false
        @game.difficulty_modes.each do |dm|
            dm.deck_selections.each do |ds|
                if ds.deck_id == @deck.id
                    deck_in_use = true
                end
            end
        end
        
        if deck_in_use
            redirect_to game_path(@game), :flash => { :error => "Deck still in use - delete the deck selections that refer to it first"}
        else
            @deck = Deck.find(params[:id])
            @deck.destroy
            redirect_to game_path(@game)
        end
            
    end
    
    private
    def deck_params
      params.require(:deck).permit(:name)
    end
    
end
