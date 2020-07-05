class AddColumnToAnimal < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :user_id, :integer
  end
end
