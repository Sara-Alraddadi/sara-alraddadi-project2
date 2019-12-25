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
        @game = Game.find(params[:review][:game_id])
        Review.create(params.require(:review).permit(:content, :game_id , :user_id)) 
        # @review.game_id = params[:game_id]
        # @review.user_id = current_user.id
        # @review.save
               
        redirect_to @game
      end  
      def edit
        # @review = Review.find(params[:id])
        @game = Game.find(params[:game_id])
        @review= Review.find(params[:id])
    end
    def update
        @review = Review.find(params[:game_id])
        # @review.update(params.require(:review).permit(:content, :game_id , :user_id))
        # @game = Game.find(params[:review][:game_id])
        # Review.update(params.require(:review).permit(:content, :game_id , :user_id)) 
        # redirect_to review
        @review.update(params.require(:review).permit(:content, :game_id , :user_id))
        game = Game.find(params[:review][:game_id])
        @review.update(params.require(:review).permit(:content))
        redirect_to book
    end
    def destroy
        Review.find(params[:id]).destroy
      
        redirect_to games_path
    end    
end
