class GamesController < ApplicationController
    before_action :authenticate_user!, except:[:show, :gameindex] 
    def gameindex 
        @games = Game.all  
    end
   
    def show
        @game = Game.find(params[:id])
        @reviews = @game.reviews  
    end
    def new
        @game = Game.new
    end
    # def create
    #     Game.create(params.require(:game).permit(:name, :published_date, :user_rate, :price, :description, :img))
    #     redirect_to games_path
    # end
    def create    
        @game = Game.new(params.require(:game).permit(:name, :published_date, :user_rate, :price, :description, :img))
        @game.user_id = current_user.id
        @game.save
        redirect_to @game
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
