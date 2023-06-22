class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        redirect_to article_path(@article)
    end
    def destroy
        @article = Article.find(params[:article_id])
        if @article.nil?
            puts "This article is not existing"
        # else
        #     Comment.find(params[:id]).destroy
        #     # @comment.destroy
        #     redirect_to article_path(@article)
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:commenter, :body)
    end
end
