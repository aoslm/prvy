class CreateAs < ActiveRecord::Migration
  def change
    create_table :as do |t|
      t.integer :name

      t.timestamps
    end
  end
end
