class Review < ApplicationRecord
  belongs_to :hair
  belongs_to :user
  validates :content, presence: true
end
