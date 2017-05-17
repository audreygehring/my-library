class CreateBookAssignment < ActiveRecord::Migration[5.0]
  def change
    create_table :assignments do |t|
      t.belongs_to :book, null: false
      t.belongs_to :booklist, null: false
      t.timestamps 
    end
  end
end
