class AddNameToHair < ActiveRecord::Migration[7.1]
  def change
    add_column :hairs, :name, :string
  end
end
