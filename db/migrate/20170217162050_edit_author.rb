class EditAuthor < ActiveRecord::Migration[5.0]
  def change
    change_table :books do |t|
      t.remove :author_id
    end
  end
end
