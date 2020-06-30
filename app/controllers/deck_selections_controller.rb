class DeckSelectionsController < ApplicationController
    
    def create
        @difficulty_mode = DifficultyMode.find(params[:difficulty_mode_id])
        @deck_selection = @difficulty_mode.deck_selections.create(deck_selection_params)
        redirect_to game_difficulty_mode_path(:id => @difficulty_mode.id)
    end
    
    def show
        @deck_selection = DeckSelection.find(params[:id])    
    end
    
    private
    def deck_selection_params
      params.require(:deck_selection).permit(:deck_id, :number_of_cards)
    end
    
    
end
