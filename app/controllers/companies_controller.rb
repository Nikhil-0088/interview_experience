class CompaniesController < ApplicationController 
    before_action :require_admin,only:[:new,:create]
    def new
        @company=Company.new
        @pending_companies=Company.where(approve: false)
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
        @experiences=@company.experiences.where(approved: true).paginate(page: params[:page],per_page: 2)
        # @experiences = @company.experiences.where(approved: true).joins(:upvoted_by_users)
        #                                   .group('experiences.id')
        #                                   .order('COUNT(upvotes.id) DESC')

    end 
    def index 
         @companies = Company.where(approve: true).order(:name).paginate(page: params[:page], per_page: 3)  
         puts Company.where(approve: true).order(:name).to_sql
    end 
    def search
        @companies = Company.where("name LIKE ?", "%#{params[:query]}%").where(approve: true)
        render json: @companies.pluck(:name, :id)
    end
    def user_added
       @company=Company.new(params.require(:companies).permit(:name))
       @company.approve = false;
       if @company.save 
        flash[:notice]="Admin will soon add that company!"
        redirect_to root_path
       else
         flash[:alert]="That company already exsists"
         redirect_to root_path
       end
    end 
    def approve
       @company=Company.find(params[:company_id]);
       @company.approve= true
       if @company.save 
        flash[:notice]="Company added Successfully!"
        redirect_to new_company_path 
       else 
        flash[:notice]="There was some Error!"
        redirect_to root_path
       end 
    end 
    def reject 
        @company=Company.find(params[:company_id]);
        @company.destroy 
        flash[:alert]="Rejected the Company"
        redirect_to new_company_path
    end 
    def destroy 
        @company=Company.find(params[:id]);
        @company.destroy 
        flash[:alert]="Deleted the Company"
        redirect_to companies_path
    end
    private 
     def require_admin
        if !(logged_in? and current_user.admin?)
            flash[:alert]="You need to be an admin to do so"
            redirect_to companies_path
        end 
     end 
end 