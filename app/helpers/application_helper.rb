module ApplicationHelper
    def pending_approvals
        Company.where(approve: false).count
    end 
    def get_company_url(company)
        "https://logo.clearbit.com/#{company}.com"
    end 

    def image_alt(company_name)
        content_tag(:h1, company_name)
    end
end
