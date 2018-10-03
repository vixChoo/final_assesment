class CreateTestings < ActiveRecord::Migration[5.2]
  def change
    create_table :testings do |t|
      t.string :name
      t.integer :price
      t.text :description
      t.float :postcode
      t.date :birthday
      t.datetime :daylight

      t.timestamps
    end
  end
end
