module ApplicationHelper
    def pending_approvals
        Experience.where(approved: false).count
    end 
end
