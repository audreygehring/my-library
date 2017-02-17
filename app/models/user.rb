class User < ApplicationRecord

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_format_of :email, :with => /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :trackable,
          :validatable
end
