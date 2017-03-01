class Remove < ActiveRecord::Migration[5.0]
  def up
    remove_column :books, :author
  end
  def down
    add_column :books, :author, :string
  end
end
