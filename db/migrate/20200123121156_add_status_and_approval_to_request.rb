class AddStatusAndApprovalToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests,:status, :boolean
    add_column :requests,:approval, :boolean
  end
end
