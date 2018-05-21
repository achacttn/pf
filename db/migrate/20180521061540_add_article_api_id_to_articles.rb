class AddArticleApiIdToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :article_api_id, :text 
  end
end
