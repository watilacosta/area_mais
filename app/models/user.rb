class User < ApplicationRecord
  belongs_to :plan, inverse_of: :users, optional: true
  has_many :memberships, inverse_of: :user
  has_many :owned_areas, class_name: "ExclusiveArea", foreign_key: "owner_id", inverse_of: :owner

  has_secure_password

  enum :role, [ :admin, :owner, :member ], prefix: true

  validates :name, :role, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { password.present? }

  scope :non_members, -> { where.not(role: :member) }
end
