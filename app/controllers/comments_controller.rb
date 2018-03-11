class CommentsController < ApplicationController
  def create
    article.comments.create(comment_params)
    redirect_to article_path(article)
  end

  def destroy
    article.comments.find(params[:id]).destroy
    redirect_to article_path(article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body)
  end

  def article
    Article.find(params[:article_id])
  end
end
