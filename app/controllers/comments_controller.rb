# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comment_params)
    
    if contains_sensitive_words?(@comment.body)
      @comment.body = censor_sensitive_words(@comment.body)
    end
    
    if @comment.save
      redirect_to @article
    else
      render 'articles/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def contains_sensitive_words?(text)
    # Implement spam protection logic
    # Example:
    sensitive_words = %w[badword anotherbadword]
    sensitive_words.any? { |word| text.include?(word) }
  end

  def censor_sensitive_words(text)
    # Implement censoring logic
    sensitive_words = %w[badword anotherbadword]
    sensitive_words.each do |word|
      text.gsub!(word, '****')
    end
    text
  end
end

