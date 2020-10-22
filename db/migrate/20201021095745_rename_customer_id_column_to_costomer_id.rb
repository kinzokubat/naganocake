class RenameCustomerIdColumnToCostomerId < ActiveRecord::Migration[5.2]
  def change
    rename_column :cart_items, :customer_id, :costomer_id
  end
end
