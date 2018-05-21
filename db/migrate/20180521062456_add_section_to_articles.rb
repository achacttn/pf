class AddSectionToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :section, :text 
  end
end
