class ChangeBooklist < ActiveRecord::Migration[5.0]
  def change
    remove_reference :books, :book_list
  end
end
