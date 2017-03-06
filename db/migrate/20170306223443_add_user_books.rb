class AddUserBooks < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :user, index: true
  end
end
