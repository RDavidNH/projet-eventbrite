class Event < ApplicationRecord

    validates :title, presence: true, uniqueness: true
    validates :start_date, presence: true
    validates :duration, presence: true, numericality: { only_integer: true }
    validates :description, presence: true
    validates :price, presence: true, numericality: true
    validates :location, presence: true
    validates :user, presence: true
    validate :photo_validation
    validate :start_date_validation

    has_one_attached :photo
    belongs_to :user
    has_many :attendances
    has_many :users, through: :attendances

    private
    def start_date_validation
        if start_date.nil?
          errors.add(:start_date, 'must be a datetime')
        elsif start_date < Date.today
          errors.add(:start_date, "can't be in the past")
        end
    end

    def photo_validation
    if not photo.attached?
        errors.add(:photo, "can't be blank")
    end
  end
end
