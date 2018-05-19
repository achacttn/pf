class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text :title
      t.datetime :publish_date
      t.text :url

      t.timestamps
    end
  end
end
