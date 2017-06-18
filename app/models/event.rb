class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances
  has_many :comments
  has_many :users_commented, through: :comments, source: :user
  has_many :attendees, through: :attendances, source: :user
  validates_presence_of :name, :date, :user_id, :location
  validate :event_date_cannot_be_in_the_past
  validates_presence_of :state, length: { is: 2 }

  def event_date_cannot_be_in_the_past
    if self.date.present? && self.date < Date.today
      errors.add(:date, "can't be in the past")
    end
  end

end
