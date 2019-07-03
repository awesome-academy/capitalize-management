class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_funds
  has_many :funds, through: :user_funds
  has_one_attached :avatar
  before_save :avatar_nil

  def avatar_nil
    return if avatar.attached?
    avatar.attach(io: File.open("#{Rails.root}/vendor/assets/images/profile.jpg"), filename: "profile.jpg", content_type: "image/jpeg")
  end
end
