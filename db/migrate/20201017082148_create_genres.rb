class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name
      t.timestamp :update_at
      t.timestamp :created_at
      t.boolean :is_active

      t.timestamps
    end
  end
end
