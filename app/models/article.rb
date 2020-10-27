class Article < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
  # varidates :description length:   
end
