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

  # Display the form for a new article
  def new
    @article = Article.new
  end

  # Create a new article
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  # Display the form for editing an article
  def edit
    @article = Article.find(params[:id])
  end

  # Update an existing article
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  # Delete an article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully destroyed.'
  end

  private

  # Strong parameters for article creation and updating
  def article_params
    params.require(:article).permit(:title, :body, :category)
  end
end

