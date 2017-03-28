class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user
  accepts_nested_attributes_for :author

  validates :title, presence: true
  validates :author, presence: true
  validates :publication_date, presence: true
  validates :pages, presence: true

end
