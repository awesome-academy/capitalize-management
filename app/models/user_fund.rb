class UserFund < ApplicationRecord
  has_many :histories
  has_many :statements
  has_many :days
  belongs_to :user
  belongs_to :fund
end
