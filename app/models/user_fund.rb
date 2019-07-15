class UserFund < ApplicationRecord
  has_many :histories, dependent: :destroy
  has_many :statements, dependent: :destroy
  has_many :days, dependent: :destroy
  has_many :members, class_name: "UserFund", foreign_key: "founder_id"
  belongs_to :user
  belongs_to :fund
  belongs_to :manager, class_name: "UserFund", optional: true, foreign_key: "founder_id"

  accepts_nested_attributes_for :user, reject_if: :all_blank
  accepts_nested_attributes_for :histories, reject_if: :all_blank

  before_update :update_founder, if: [:founder, :founder_id]
  after_commit :add_members, if: :founder, unless: :founder_id

  delegate :user, to: :manager, prefix: :founder

  scope :fund_index, ->(user_id) {where(user_id: user_id).includes({manager: :user}, :fund, :user)}

  def set_founder
    update founder: true, founder_id: nil
  end

  private
  def update_founder
    self.founder = false unless id == founder_id
  end

  def add_members
    members << fund.user_funds
  end
end
