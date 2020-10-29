class Article < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  has_one_attached :avater
  # varidates :description length:   
end
