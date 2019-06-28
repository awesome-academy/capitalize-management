class Week < ApplicationRecord
  has_many :days
  belongs_to :month
end
