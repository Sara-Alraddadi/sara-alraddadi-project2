class ReviewsController < ApplicationController
    before_action :authenticate_user!
    def index
    end

    def show
    end
    def new
        @game = Game.find(params[:game_id])
        @review = Review.new
    end
    def create
        puts params
        @review = Review.new(params.require(:review).permit(:content, :game_id , :user_id)) 
        @review.game_id = params[:game_id]
        @review.user_id = current_user.id
        @review.save
               
        redirect_to "/games"
      end      
end
