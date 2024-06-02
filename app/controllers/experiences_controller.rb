class ExperiencesController < ApplicationController
    before_action :setexperience ,only: [:edit, :update, :show, :destroy]
    before_action :require_user,except: [:show,:index,:intern,:placement]
    before_action :require_same_user,only: [:edit, :update, :destroy]
    def new
        @company=Company.new()
        @experience=Experience.new()
    end 
    def create
        @experience=Experience.new(params.require(:experience).permit(:role, :OnlineTest, :TechRound1,:TechRound2, :HrRound, :Preparations,:company_id))
        @experience.user_id=current_user.id
        @experience.approved=true
        if @experience.save 
            @users=@experience.company.subscribed_users;
            @users.each do |user|
              NotifyMailer.with(experience: @experience,user: user).notify.deliver_later
            end 
            flash[:notice]="Your Experience was Published sucessfully"
            redirect_to @experience
        else 
            render 'new'
        end 
    end 
    def update
        if @experience.update(params.require(:experience).permit(:role, :OnlineTest, :TechRound1,:TechRound2, :HrRound, :Preparations,:company_id))
            flash[:notice]="Experience was updated successfully"
            redirect_to @experience
        else
            render 'edit'
        end
    end 
    def edit 
    end 
    def show 
        @comments =Comment.where(experience_id: @experience.id)
    end 
    def index
        @experiences=Experience.all
    end 
    def destroy 
        @experience.destroy
        flash[:alert]="Experience is deleted"
        redirect_to user_path(current_user)
    end 
    def intern 
       @experiences=Experience.where(role: "Internship").left_outer_joins(:upvoted_by_users).group('experiences.id').paginate(page: params[:page], per_page: 3).order('COUNT(upvotes.id) DESC')
    end 
    def placement
       @experiences=Experience.where(role: "Placement").left_outer_joins(:upvoted_by_users).group('experiences.id').paginate(page: params[:page], per_page: 3).order('COUNT(upvotes.id) DESC')
    end
    private 
    def setexperience
        @experience=Experience.find(params[:id])
     end
     def require_user 
        if !logged_in? 
            flash[:alert]="You must log In to perform that task"
            redirect_to root_path
        end
     end 
     def require_same_user
        if current_user!=@experience.user && !current_user.admin?
            flash[:alert]="You must log In to perform that task"
            redirect_to @experience
        end
     end
end