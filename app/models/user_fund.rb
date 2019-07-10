class UserFund < ApplicationRecord
  has_many :histories
  has_many :statements
  has_many :days
  belongs_to :user
  belongs_to :fund

  accepts_nested_attributes_for :user, reject_if: :all_blank
  accepts_nested_attributes_for :histories, reject_if: :all_blank
end
