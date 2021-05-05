class Restrictions < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :collections, :users
    remove_foreign_key :notes, :collections
    add_foreign_key :collections, :users, on_delete: :cascade, on_update: :cascade
    add_foreign_key :notes, :collections,  on_delete: :cascade, on_update: :cascade
  end
end
