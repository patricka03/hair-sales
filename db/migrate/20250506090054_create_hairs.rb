class CreateHairs < ActiveRecord::Migration[7.1]
  def change
    create_table :hairs do |t|

      t.timestamps
    end
  end
end
