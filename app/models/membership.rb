class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :exclusive_area
end
