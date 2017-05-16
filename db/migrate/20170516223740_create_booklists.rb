class CreateBooklists < ActiveRecord::Migration[5.0]
  def change
    create_table :booklists do |t|
      t.string :booklist_title, null: false
      t.belongs_to :user, null: false
      t.text :description
    end
  end
end
