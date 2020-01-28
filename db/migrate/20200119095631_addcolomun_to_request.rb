class AddcolomunToRequest < ActiveRecord::Migration[5.1]
  def change
    add_column :requests,:account, :string
    add_column :requests,:description, :string
    add_column :requests,:entarting_station, :string
    add_column :requests,:gettingoff_station, :string
    add_column :requests,:via_station, :string
    add_column :requests,:smallamount_eating, :boolean
  end
end
