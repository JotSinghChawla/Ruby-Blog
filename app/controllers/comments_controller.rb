class CommentsController < ApplicationController
    
    before_action :authenticate_user!

    before_action :check_comment_owner, only: [:destroy]

    def create
        # if request.post?
            @article = Article.find(params[:article_id])
            @comment = @article.comments.create(comment_params.merge(user_id: current_user.id))

            # @comment = Comment.new(comment_params)
            # @comment.article_id ||= params[:article_id]
            # if @comments.save

            redirect_to article_path(@article)
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private 

    def check_comment_owner 
        if user_signed_in?
            current_article = Article.find(params[:id])
            unless current_user.id == current_article.user_id
              flash[:alert]='Access denied! You are not owner of this Comment'
              redirect_to "/articles/#{current_article.id}"
            end
          end
    end

    def comment_params
        params.require(:comment).permit(:user, :body)
    end

end


