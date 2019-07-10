class Statement < ApplicationRecord
  belongs_to :user_fund

  validates_presence_of :money, :stop_loss, :take_profit, :loss, :profit

  STATEMENT_PARAMS = [:money, :guess, :status, :stop_loss, :take_profit, :loss,
    :profit, :picture, :created_at, :updated_at].freeze

  scope :list, (lambda do
    select :id, :money , :guess, :status, :stop_loss, :take_profit, :loss, :profit,
      :picture, :created_at, :updated_at
  end)
end
