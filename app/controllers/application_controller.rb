class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in? 
    def current_user
        #to return the current user who is logged in ?
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end
    def logged_in?
        #check if we have a user who is loggged in 
        !!current_user #to convert the current user function into boolean 
    end
    
end
