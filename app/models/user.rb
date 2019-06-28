class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_funds
  has_many :funds, through: :user_funds
end
