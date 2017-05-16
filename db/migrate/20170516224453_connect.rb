class Connect < ActiveRecord::Migration[5.0]
  def change
    add_reference :books, :book_list, index: true
  end
end
