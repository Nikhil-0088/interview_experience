module ApplicationHelper
    def pending_approvals
        Company.where(approve: false).count
    end 
    def get_company_url(company)
        url = "https://logo.clearbit.com/#{company}.com"
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        response = http.get(uri.request_uri)        
        # Check if the response is successful (status code 200)
        if response.is_a?(Net::HTTPSuccess)
            return url
        else
            return asset_path('default.png');
        end
    end

    def image_alt(company_name)
        content_tag(:h1, company_name)
    end
end
