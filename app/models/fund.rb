class Fund < ApplicationRecord
  has_many :user_funds
  has_many :users, through: :user_funds
end
