class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :confirmable
  has_many :user_funds, dependent: :destroy
  has_many :funds, through: :user_funds
  has_one_attached :avatar
  before_save :avatar_nil


  before_create :set_password
  attr_accessor :skip_password_validation

  protected
  def password_required?
    return false if skip_password_validation
    super
  end

  private
  def set_password
    if skip_password_validation
      self.password = Devise.friendly_token.first(Settings.random_pw)
      self.password_confirmation = password
    end
  end

  def avatar_nil
    return if avatar.attached?
    avatar.attach(io: File.open("#{Rails.root}/vendor/assets/images/profile.jpg"), filename: "profile.jpg", content_type: "image/jpeg")
  end
end
