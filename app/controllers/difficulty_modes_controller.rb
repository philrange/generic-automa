class DifficultyModesController < ApplicationController
    
    def show
         @difficulty_mode = DifficultyMode.find(params[:id])  
    end
    
  def create
    @game = Game.find(params[:game_id])
    @difficulty_mode = @game.difficulty_modes.create(difficulty_mode_params)
    redirect_to game_path(@game)
  end
    
    def destroy
        @difficulty_mode = DifficultyMode.find(params[:id])
        @difficulty_mode.destroy
        
        @game = Game.find(params[:game_id])
        redirect_to game_path(@game)
    end
 
  private
    def difficulty_mode_params
      params.require(:difficulty_mode).permit(:name)
    end
    
end
