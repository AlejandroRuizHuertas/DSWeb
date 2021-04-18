class AddUserToNotes < ActiveRecord::Migration[6.1]
  def change
    add_reference :notes, :user
  end
end
