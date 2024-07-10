# app/models/article.rb
class Article < ApplicationRecord
    belongs_to :category  # Each article belongs to a single category
    validates :title, :body, :category_id, presence: true  # Ensure category_id is present
  end
  

