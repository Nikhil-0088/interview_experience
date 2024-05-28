class UsersController < ApplicationController 
  def new 
    @user =User.new()
  end 
  def create 
    @user=User.new(params.require(:user).permit(:name, :email, :password))
    if @user.save 
      session[:user_id]=@user.id
      flash[:notice]="Welcome #{@user.name} you have succesfully signed up"
      redirect_to @user
    else 
      render 'new'
    end 
  end 
  def show 
    @user =User.find(params[:id])
    @experiences=@user.experiences
  end 
end 