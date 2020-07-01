class PlayController < ApplicationController
    
    def index
        
        @game = Game.find(params[:game_id])
        @difficulty_mode = @game.difficulty_modes.find(params[:select_difficulty_id])
        @deck_selections = @difficulty_mode.deck_selections
        
        @cards_for_this_game = []
        
#        todo - get correct number of cards based on deck selection - number_of_cards
        @deck_selections.each do |deck_selection|
            @cards_for_this_game.push(*deck_selection.deck.cards.sample(deck_selection.number_of_cards))
        end
    end
    
    
    
end
