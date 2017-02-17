class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.belongs_to :author, null: false
      t.string :publication_date, null: false
      t.text :description
      t.integer :pages, null: false
    end
  end
end
