class CommentsController < ApplicationController
    before_action :require_user,only:[ :create,:destroy]
    def create 
        @experience=Experience.find(params[:experience_id])
       @comment=Comment.new(user_id: current_user.id,experience_id: params[:experience_id],content: params[:comment][:content])
       if @comment.save 
         flash[:notice]="Commented Succesfully!!"
         redirect_to experience_path(@experience)
       else 
        flash[:alert]="Something went wrong!"
        redirect_to root_path
       end
    end  
    def destroy 
        @experience=Experience.find(params[:experience_id])
        @comment=Comment.find(params[:id])
        @comment.destroy
        flash[:alert]="Comment deleted"
        redirect_to @experience
    end
    private
    def require_user 
        if !logged_in?
            flash[:alert]="Log In to add a comment"
            redirect_to root_path
        end
    end  
end 