class AddAdmin2 < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :isAdmin, :boolean, :default => 0
  end
end
