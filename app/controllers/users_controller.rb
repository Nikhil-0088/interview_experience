class UsersController < ApplicationController 
  before_action :setuser,only: [:edit, :update, :show]
  before_action :logged_in?,except: [:new,:create]
  before_action :same_user,only: [:edit, :update]
  def new 
    @user =User.new()
  end 
  def create 
    @user=User.new(params.require(:user).permit(:name, :email, :password,:profile_picture))
    if @user.save 
      session[:user_id]=@user.id
      flash[:notice]="Welcome #{@user.name} you have succesfully signed up"
      redirect_to root_path
    else 
      render 'new'
    end 
  end 
  def show 
    @experiences=@user.experiences
    @companies=@user.subscribed_companies
  end 
  def edit 
  end 
  def update 
    if @user.update(params.require(:user).permit(:name, :email, :password,:profile_picture))
      flash[:notice]="Profile updated successfully"
      redirect_to @user
    else 
      render 'edit'
    end 
  end 
  def liked 
    @experiences=current_user.upvoted_experiences
  end 
  private 
  def setuser
      @user=User.find(params[:id])
   end
   def same_user 
     if current_user!=@user 
      flash[:notice]="You cannot edit or delete others profiles"
      redirect_to root_path
     end 
   end 
end 