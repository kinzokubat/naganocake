class AddColumnItems < ActiveRecord::Migration[5.2]

  # ジャンルid,販売ステータスの追加
  def change
    add_column :items, :genre_id, :integer
    add_column :items, :is_active, :boolean
  end
end
