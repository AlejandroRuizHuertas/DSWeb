class MigrationName < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :collection 
    add_reference :collections, :user
  end
end
