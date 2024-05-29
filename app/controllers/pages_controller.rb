class PagesController < ApplicationController
    def home 
        @companies=Company.all
    end  
end