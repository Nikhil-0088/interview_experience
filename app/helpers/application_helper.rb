module ApplicationHelper
    def pending_approvals
        Experience.where(approved: false).count
    end 
    def get_company_url(company)
        "https://logo.clearbit.com/#{company}.com"
    end 
end
