class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.string  :post,              null: false
      t.integer :from_id,           null: false
      t.string  :municipality,      null: false
      t.string  :house_number,      null: false
      t.string  :building,          null: false
      t.string  :tel,               null: false
 
      t.references :order, foreign_key:true

      t.timestamps
    end
  end
end
