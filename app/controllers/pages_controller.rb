class PagesController < ApplicationController
    def home
        @API_KEY = ENV["guardian_api_key"]
        @query = params[:query]
        search_url = "https://content.guardianapis.com/search?api-key=3586b109-00df-4137-9778-6a629c781425"
        @results = HTTParty.get( search_url )

        @article_array = []
        Article.find_each do |x|
            @article_array.push(x)
        end
    end
end

