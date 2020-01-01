class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.references :organization, foreign_key: true
      t.string :name
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
