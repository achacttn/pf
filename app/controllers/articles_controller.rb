class ArticlesController < ApplicationController
    $API_KEY = ENV["guardian_api_key"]

    def show
        article_id = params[:id]
        @chosen_article = Article.find(article_id)

        @chosen_article_subjects = []
        @chosen_article.comments.each do |cmt|
            @chosen_article_subjects.push(cmt.subject)
        end

        @chosen_article_subjects.uniq!

        @comment = Comment.new
    end

    def new_with_comment
        article_fetch = "https://content.guardianapis.com/#{ params[:url] }?api-key=#{$API_KEY}"
        @article_temp = HTTParty.get( article_fetch )
        @article_temp_info = @article_temp["response"]["content"]

        @comment = Comment.new
    end

    def create_with_comment
        article_get = "https://content.guardianapis.com/#{ params[:article_id] }?api-key=#{$API_KEY}"
        article_field = HTTParty.get( article_get )
        article_field_info = article_field["response"]["content"]
        new_article = Article.new
        new_article.title = article_field_info["webTitle"]
        new_article.publish_date = article_field_info["webPublicationDate"]
        new_article.url = article_field_info["webUrl"]
        new_article.article_api_id = article_field_info["id"]
        new_article.section = article_field_info["sectionName"]
        new_article.save

        new_comment = Comment.new
        new_comment.subject = params["comment"]["subject"]
        new_comment.text_body = params["comment"]["text_body"]
        new_comment.user_id = @current_user.id
        new_comment.article_id = new_article.id
        new_comment.save

        redirect_to article_path( new_article.id )
    # httparty requst using params[:article_id]
    # Article.create with those results
    # Comment.create with params, article & user associations

    end

end