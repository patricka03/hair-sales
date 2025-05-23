class Hair < ApplicationRecord
  has_many :orders, dependent: :destroy
  has_many :users, through: :orders
  has_many :reviews, dependent: :destroy
  belongs_to :admin, class_name: "User", optional: true
  has_one_attached :photo
  validates :photo, :name, :price, :length, :texture, :origin, :quantity, presence: true
  validates :length, inclusion: { in: [10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40] }
  validates :texture, inclusion: { in: ["Straight", "Body Wave", "Deep Wave", "Loose Wave", "Water Wave", "Kinky Curly", "Yaki Straight", "Kinky Straight", "Vietnamese Straight", "Cambodian Wavy", "Burmese Curly"] }
  validates :origin, inclusion: { in: ["Peruvian", "Brazilian", "Indian"] }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
  validates :quantity, numericality: { greater_than_or_equal_to: 0 }
end
