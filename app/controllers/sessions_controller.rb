class SessionsController < ApplicationController
    def new
    end
    def create 
        user=User.find_by(email: params[:sessions][:email].downcase)
        if user && user.authenticate(params[:sessions][:password])
            session[:user_id]=user.id
            flash[:notice]="Logged in successfully"
            redirect_to root_path
        else
            flash.now[:alert]="There was something wrong with your login details"
            render 'new'
        end

    end
    def destroy
        session[:user_id]=nil
        flash[:alert]="Logged Out"
        redirect_to root_path
    end
end