class CommentsController < ApplicationController
    
    def create
        # if request.post?
            @article = Article.find(params[:article_id])
            @comment = @article.comments.create(comment_params)

            # @comment = Comment.new(comment_params)
            # @comment.article_id ||= params[:article_id]
            # if @comments.save
                redirect_to article_path(@article)

        # end
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article)
    end

    private 

    def comment_params
        params.require(:comment).permit(:user, :body)
    end

end


