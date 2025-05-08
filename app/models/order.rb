class Order < ApplicationRecord
  belongs_to :hair
  belongs_to :user
  validates :price, presence: true
  validates :status, inclusion: { in: ["pending", "paid", "failed"], message: "%{value} is not a valid status" }
end
