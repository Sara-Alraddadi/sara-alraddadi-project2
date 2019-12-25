class PagesController < ActionController::Base
   
     def mygame
        @games =Game.where(user_id: current_user.id)

    end
end
