class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :location, :state
  has_many :events
  has_many :attendances
  has_many :comments
  has_many :events_commented, through: :comments, source: :event

  has_many :events_attending, through: :attendances, source: :event
end
