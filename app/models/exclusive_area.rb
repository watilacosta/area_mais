class ExclusiveArea < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id", inverse_of: :owned_areas
  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  validates :name, presence: true, uniqueness: { scope: :owner_id }
  validates :description
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
