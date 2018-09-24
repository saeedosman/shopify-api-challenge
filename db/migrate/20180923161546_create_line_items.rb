class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :quantity
      t.decimal :price
      t.belongs_to :order, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
