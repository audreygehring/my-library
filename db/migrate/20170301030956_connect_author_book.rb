class ConnectAuthorBook < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :author, index: true
    add_reference :authors, :book, index: true
  end
end
