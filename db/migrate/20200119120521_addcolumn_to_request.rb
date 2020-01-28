class AddcolumnToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests,:number_of_people, :integer
  end
end
