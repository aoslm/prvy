class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
      t.string :name
      t.string :name_eng
      t.integer :energy
			
      t.timestamps
    end
  end
end
