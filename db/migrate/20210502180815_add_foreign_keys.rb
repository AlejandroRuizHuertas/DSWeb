class AddForeignKeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :collection 
    add_reference :collections, :user
    add_foreign_key :collections, :users
    add_foreign_key :notes, :collections
  end
end
