class CreateArguments < ActiveRecord::Migration[5.2]
  def change
    create_table :arguments do |t|
      t.text :title
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
  end
end
