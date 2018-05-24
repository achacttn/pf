class CommentsController < ApplicationController
    def create
        comment = Comment.new( comment_params )
        comment.article_id = params[:article_id]
        comment.user_id = @current_user.id
        comment.save
        redirect_to article_path( :article_id )
    end

    private
    def comment_params
        params.require(:comment).permit(:text_body, :user_id, :article_id, :subject)
    end
end