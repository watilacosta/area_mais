class ExclusiveArea < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :memberships
  has_many :members, through: :memberships, source: :user
  has_many :contents
end
