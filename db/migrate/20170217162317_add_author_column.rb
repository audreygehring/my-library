class AddAuthorColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :author, :string, null: false
  end
end
