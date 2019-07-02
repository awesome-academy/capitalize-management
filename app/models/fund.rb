class Fund < ApplicationRecord
  has_many :user_funds
  has_many :users, through: :user_funds

  validates_presence_of :name

  FUND_PARAMS = [:name, :total_money, :created_at, :updated_at].freeze

  scope :list, (lambda do
    select :id, :name, :total_money, :created_at, :updated_at
  end)
end
