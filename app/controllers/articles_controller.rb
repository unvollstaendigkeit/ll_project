class ArticlesController < ApplicationController
  # Display all articles
  def index
    @categories = Category.all
    @articles = Article.all
    @recent_articles = Article.order(created_at: :desc).limit(5)
  end

  # Display a specific article along with its comments
  def show
    @article = Article.find(params[:id])
    @categories = Category.all
  end

  private

  # Strong parameters for comment creation
  def comment_params
    params.require(:comment).permit(:body)
  end
end
