class GamesController < ApplicationController
    before_action :authenticate_user!
    def gameindex 
        @games = Game.all  
    end
   
    def show
        @game = Game.find(params[:id])
        @reviews = @game.reviews # Not sure 
    end
    def new
        @game = Game.new
    end
    def create
        Game.create(params.require(:game).permit(:name, :published_date, :user_rate, :price, :description, :img))
        redirect_to games_path
    end
    def edit
        @game = Game.find(params[:id])
    end
    def update
        game = Game.find(params[:id])
        game.update(params.require(:game).permit(:name, :published_date, :user_rate, :price, :description, :img))
          
        redirect_to game
    end
    def destroy
        Game.find(params[:id]).destroy
      
        redirect_to games_path
    end
end
