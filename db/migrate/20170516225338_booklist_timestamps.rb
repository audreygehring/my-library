class BooklistTimestamps < ActiveRecord::Migration[5.0]
  def change
    add_column :booklists, :created_at, :datetime
    add_column :booklists, :updated_at, :datetime
  end
end
