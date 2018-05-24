class CommentsController < ApplicationController
    
    before_action :check_if_logged_in

    def create_comment
        # comment = Comment.new( comment_params )
        # comment.article_id = params[:article_id]
        # comment.user_id = @current_user.id
        # comment.save
        Comment.create(
            :subject => params[:subject],
            :text_body => params[:text_body],
            :article_id => params[:article_id],
            :user_id => @current_user.id
        )

        redirect_to article_path( params[:article_id] )
    end

    private
    def comment_params
        params.require(:comment).permit(:text_body, :user_id, :article_id, :subject)
    end
end