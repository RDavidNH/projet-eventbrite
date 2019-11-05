class Event < ApplicationRecord

  validates :title, presence: true
  validates :start_date, presence: true
  validates :duration, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true
  validates :user, presence: true
  
  belongs_to :user
  has_many :attendances
  has_many :users, through: :attendances
end
