class CompaniesController < ApplicationController 
    before_action :require_admin,only:[:new,:create]
    def new
        @company=Company.new
    end 
    def create 
        @company=Company.new(params.require(:company).permit(:name))
        if @company.save 
            flash[:notice]="Company added Successfully"
            redirect_to @company
        else 
            render 'new'
        end 
    end
    def show 
        @company=Company.find(params[:id])
        @experiences=@company.experiences.where(approved: true)
    end 
    def index 
        @companies=Company.all
    end 
    def search
        @companies = Company.where("name LIKE ?", "%#{params[:query]}%")
        render json: @companies.pluck(:name, :id)
      end
    private 
     def require_admin
        if !(logged_in? and current_user.admin?)
            flash[:alert]="You need to be an admin to do so"
            redirect_to companies_path
        end 
     end 
end 