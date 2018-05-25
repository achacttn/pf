class CommentsController < ApplicationController

    before_action :check_if_logged_in

    def create_comment
        # comment = Comment.new( comment_params )
        # comment.article_id = params[:article_id]
        # comment.user_id = @current_user.id
        # comment.save
        comment = Comment.new
        if params[:subject].length == 0 || params[:text_body].length == 0
            flash[:errors] = comment.errors.full_messages
            redirect_back(fallback_location: root_path)
        else
            Comment.create(
                :subject => params[:subject],
                :text_body => params[:text_body],
                :article_id => params[:article_id],
                :user_id => @current_user.id
            )
            redirect_to article_path( params[:article_id] )
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:text_body, :user_id, :article_id, :subject)
    end
end