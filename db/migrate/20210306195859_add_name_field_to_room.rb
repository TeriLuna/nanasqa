class AddNameFieldToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :name, :string, default: ""
  end
end
