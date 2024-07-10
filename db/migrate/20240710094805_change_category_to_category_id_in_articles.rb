class ChangeCategoryToCategoryIdInArticles < ActiveRecord::Migration[7.1]
  def change
    rename_column :articles, :category, :category_id
    change_column :articles, :category_id, :integer
    add_index :articles, :category_id
  end
end

