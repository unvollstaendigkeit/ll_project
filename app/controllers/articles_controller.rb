class ArticlesController < ApplicationController
  # Display all articles
  def index
    @articles = Article.all
  end

  # Display a specific article along with its comments
  def show
    @article = Article.find(params[:id])
    @comments = @article.comments
    @comment = Comment.new
  end

  private

  # Strong parameters for comment creation
  def comment_params
    params.require(:comment).permit(:body)
  end
end
