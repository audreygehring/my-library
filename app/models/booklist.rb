class Booklist < ApplicationRecord
  has_many :assignments
  has_many :books, through: :assignments
end
