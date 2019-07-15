class Fund < ApplicationRecord

  FUND_PARAMS = [:name,
    :total_money,
    :founder_id,
    {user_funds_attributes: [
      {user_attributes: [:email, :skip_password_validation]},
      {histories_attributes: [:money, :status]},
      :founder,
      :user_id
    ]}
  ].freeze

  has_many :user_funds, dependent: :destroy
  has_many :users, through: :user_funds, dependent: :destroy

  accepts_nested_attributes_for :user_funds, reject_if: :duplicate, allow_destroy: true

  validates_presence_of :name

  scope :list, (lambda do
    select :id, :name, :total_money, :created_at, :updated_at
  end)

  def duplicate attr
    return false if user_funds.blank?
    return true if user_funds.last.user_id == attr[:user_id].to_i
  end
end
