class AddAdminToHairs < ActiveRecord::Migration[7.1]
  def change
    add_reference :hairs, :admin, foreign_key: { to_table: :users }
  end
end
