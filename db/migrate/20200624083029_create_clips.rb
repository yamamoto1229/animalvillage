class CreateClips < ActiveRecord::Migration[5.2]
  def change
    create_table :clips do |t|
    	t.references :user, null:false
    	t.references :animal, null:false
      t.timestamps null: false
    end
  end
end
