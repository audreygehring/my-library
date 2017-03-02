class Book < ApplicationRecord
  has_one :author
  accepts_nested_attributes_for :author

  validates :title, presence: true
  validates :author, presence: true
  validates :publication_date, presence: true
  validates :pages, presence: true

end
