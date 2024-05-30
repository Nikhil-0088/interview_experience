class SubscribesController < ApplicationController
    def create 
        @company=Company.find(params[:company_id])
        @subscribe=Subscribe.new(user: current_user,company: @company)
        if @subscribe.save 
          flash[:notice]="You Subscribed to #{@company.name}"
          redirect_to @company
        else 
         flash[:alert]="Not able to Subscribe"
         redirect_to @company
        end 
    end 
    def destroy 
        @company=Company.find(params[:company_id])
        @subscribe=Subscribe.where(user: current_user, company: @company)
        if @subscribe.first.destroy 
            flash[:alert]="Unscribed to #{@company.name}"
            redirect_to root_path
        else 
            flash[:alert]="Unable to unscribe"
            redirect_to @company
        end 
    end 
end 