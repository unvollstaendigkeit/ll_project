class Article < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :title, :body, :category, presence: true
  end
