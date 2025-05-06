class CreateHairs < ActiveRecord::Migration[7.1]
  def change
    create_table :hairs do |t|
      t.decimal :price, precision: 8, scale: 2
      t.integer :length
      t.string :texture, index: true
      t.string :origin, index: true
      t.integer :quantity, default: 0, null: false

      t.timestamps
    end
  end
end
