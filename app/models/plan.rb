class Plan < ApplicationRecord
  has_many :users, inverse_of: :plan, dependent: :nullify

  validates :name, presence: true, length: { minimum: 3, maximum: 100 }
  validates :member_limit, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
