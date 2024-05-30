class NotifyMailer < ApplicationMailer
    def notify 
        @experience=params[:experience]
        @user=params[:user]
        @url="localhost:3000/experinces/#{@experience.id}"
        mail(to: @user.email ,subject: "New experience from your Interest #{@experience.company.name}")
    end 
end
