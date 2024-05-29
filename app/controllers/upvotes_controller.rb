class UpvotesController < ApplicationController 
    def create 
       @experience=Experience.find(params[:experience_id])
       @upvote=Upvote.new(user: current_user,experience: @experience)
       if @upvote.save 
         flash[:notice]="Liked Successfully"
         redirect_to @experience
       else 
        flash[:alert]="Not able to like the Experience"
        redirect_to @experience
       end 
    end 
    def destroy 
        @experience=Experience.find(params[:experience_id])
        @upvote=Upvote.where(user: current_user, experience: @experience)
        if @upvote.first.destroy 
            flash[:alert]="Removed the Like"
            redirect_to @experience
        else 
            flash[:alert]="Unable to remove the Like"
            redirect_to @experience
        end 
    end
end 