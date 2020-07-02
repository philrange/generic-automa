class PlayController < ApplicationController
    
    def index
        
        @game = Game.find(params[:game_id])
        @difficulty_mode = @game.difficulty_modes.find(params[:select_difficulty_id])
        @deck_selections = @difficulty_mode.deck_selections
        
        @cards_for_this_game = []
        
#        todo - select a subset of these cards based on the number_of_cards set for the game
        @deck_selections.each do |deck_selection|
            number = deck_selection.number_of_cards
            if number == 0
                @cards_for_this_game.push(*deck_selection.deck.cards)
            else
                @cards_for_this_game.push(*deck_selection.deck.cards.sample(deck_selection.number_of_cards))
            end
        end
    end
    
    
    
end
