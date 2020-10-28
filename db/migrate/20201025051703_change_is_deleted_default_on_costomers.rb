class ChangeIsDeletedDefaultOnCostomers < ActiveRecord::Migration[5.2]
  def up
    change_column :costomers, :is_deleted, :boolean, default: false, null: false
  end

  def down
    change_column :costomers, :is_deleted, :boolean
  end
end