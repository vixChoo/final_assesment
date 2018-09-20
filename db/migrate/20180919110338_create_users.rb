class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest
      t.string :email
      t.string :name
      t.string :location
      t.string :image_url
      t.string :url
      t.string :provider
      t.string :uid
      t.timestamps
    end
    add_index :users, :provider
    add_index :users, :uid
    add_index :users, [:provider, :uid], unique: true
  end
end
# class CreateUsers < ActiveRecord::Migration[5.2]
#   def change
#     create_table :users do |t|
#       t.string :password_digest
#       t.string :email
#       t.string :name

#       t.timestamps
#     end
#   end
# end
   
