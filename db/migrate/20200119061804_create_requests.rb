class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.references :user, foreign_key: true
      t.integer :amount
      t.string :type

      t.timestamps
    end
    add_index :requests, [:user_id, :created_at]
  end
end
