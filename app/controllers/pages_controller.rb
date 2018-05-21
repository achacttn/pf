class PagesController < ApplicationController
    $API_KEY = ENV["guardian_api_key"]
    def home
        @article_array = []
        Article.find_each do |x|
            @article_array.push(x)
        end

        general_fetch = "https://content.guardianapis.com/search?api-key=#{$API_KEY}"
        @results = HTTParty.get( general_fetch )
    end

    def search
        @searching = params[:search_query]
        search_url = "https://content.guardianapis.com/search?q=#{@searching}&api-key=#{$API_KEY}"
        @search_results = HTTParty.get( search_url )
    end

    def category
        @category = params[:category].parameterize
        category_url = "https://content.guardianapis.com/#{@category}?api-key=#{$API_KEY}"
        @category_results = HTTParty.get( category_url )
    end

end