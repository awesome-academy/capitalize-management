class Day < ApplicationRecord
  belongs_to :user_fund
  belongs_to :week
end
