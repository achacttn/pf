class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.text :username
      t.text :password_digest
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :image

      t.timestamps 
    end
  end
end
