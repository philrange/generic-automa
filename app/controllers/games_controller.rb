class GamesController < ApplicationController
    
    def show
        @game = Game.find(params[:id])
    end
    
    def index
        @games = Game.all
    end
    
    
    def new
    end
    
    def create
        @game = Game.new(game_params)
        
        
        if @game.save
            redirect_to @game
        else
            render 'new'
        end

    end
    
     
private
  def game_params
    params.require(:game).permit(:title, :text, :loop, :number_of_cards)
  end
end
