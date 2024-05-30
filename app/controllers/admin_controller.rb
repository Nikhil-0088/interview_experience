class AdminController < ApplicationController
    before_action :require_admin
    def show 
        @experiences=Experience.where(approved: false)
    end 
    def aproove 
        @experience=Experience.find(params[:exp_id])
        @experience.approved=true 
        if @experience.save
            flash[:notice]="Experience Approved"
            @users=@experience.company.subscribed_users;
            @users.each do |user|
              NotifyMailer.with(experience: @experience,user: user).notify.deliver_later
            end 
            redirect_to aproove_path
        else 
            flash[:alert]="Experience couldnt be approved"
            redirect_to aproove_path
        end
    end 
    private 
    def require_admin
         if !(logged_in? &&current_user.admin?)
            flash[:alert]="You need to be an Admin to access the route"
            redirect_to root_path 
         end 
    end 
end 