class PagesController < ApplicationController
    $API_KEY = ENV["guardian_api_key"]
    def home
        @query = params[:query]
        search_url = "https://content.guardianapis.com/search?api-key=#{$API_KEY}"
        @results = HTTParty.get( search_url )

        @article_array = []
        Article.find_each do |x|
            @article_array.push(x)
        end
    end
    def search
    end
end

