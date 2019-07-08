class Fund < ApplicationRecord
  belongs_to :user
  has_many :user_funds, dependent: :destroy
  has_many :users, through: :user_funds

  accepts_nested_attributes_for :users, reject_if: :user_exist, allow_destroy: true
  validates_presence_of :name

  FUND_PARAMS = [:name, :total_money, :created_at, :updated_at, users_attributes: [:id, :email, :skip_password, :_destroy]].freeze

  scope :list, (lambda do
    select :id, :name, :total_money, :created_at, :updated_at
  end)

  def user_exist attr
    if user = User.find_by(email: attr[:email])
      self.users << user
      return true
    end
    return false
  end
end
