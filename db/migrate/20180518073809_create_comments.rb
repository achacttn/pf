class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :text_body
      t.integer :user_id
      t.integer :argument_id

      t.timestamps
    end
  end
end
