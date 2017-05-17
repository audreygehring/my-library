class Book < ApplicationRecord
  belongs_to :author
  belongs_to :user
  has_many :assignments
  has_many :booklists, through: :assignments
  accepts_nested_attributes_for :author

  validates :title, presence: true
  validates :author, presence: true
  validates :publication_date, presence: true
  validates :pages, presence: true
end
