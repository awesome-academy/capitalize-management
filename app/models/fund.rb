class Fund < ApplicationRecord
  has_many :user_funds, dependent: :destroy
  has_many :users, through: :user_funds

  accepts_nested_attributes_for :user_funds, reject_if: :duplicate, allow_destroy: true

  validates_presence_of :name

  FUND_PARAMS = [:name,
    :total_money,
    :created_at,
    :updated_at,
    {user_funds_attributes: [
      {user_attributes: [:email, :skip_password_validation]},
      {histories_attributes: [:money, :status]},
      :founder,
      :user_id
    ]}
  ].freeze

  scope :list, (lambda do
    select :id, :name, :total_money, :created_at, :updated_at
  end)

  def duplicate attr
    return false if user_funds.blank?
    return true if user_funds.last.user_id == attr[:user_id].to_i
  end
end
