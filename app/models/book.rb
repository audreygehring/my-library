class Book < ApplicationRecord
  belongs_to :author

  validates :title, presence: true
  validates :author, presence: true
  validates :publication_date, presence: true
  validates :pages, presence: true

end
