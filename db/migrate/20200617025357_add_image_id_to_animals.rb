class AddImageIdToAnimals < ActiveRecord::Migration[5.2]
  def change
    add_column :animals, :image_id, :string
  end
end
