class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.text :name
      t.decimal :price
      t.belongs_to :shop, foreign_key: true

      t.timestamps
    end
  end
end
