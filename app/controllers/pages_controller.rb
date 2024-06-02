class PagesController < ApplicationController
    def home 
        @companies = Company.includes(:experiences)
        .where.not(experiences: { approved: false })
        .group('companies.id')
        .order('COUNT(experiences.id) DESC')
        .limit(8)
    end  
end