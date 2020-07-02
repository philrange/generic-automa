class GamesController < ApplicationController
    
    def show
        @game = Game.find(params[:id])
    end
    
    def index
        @games = Game.all
    end
    
    
    def new
        @game = Game.new
    end
    
    def create
        @game = Game.new(game_params)
        
        
        if @game.save
            redirect_to @game
        else
            render 'new'
        end

    end
    
    def destroy
        @game = Game.find(params[:id])
        @game.destroy
        redirect_to games_path
    end
    
     
private
  def game_params
    params.require(:game).permit(:title, :text, :loop, :number_of_cards, :user_id)
  end
end
