class Event < ActiveRecord::Base
  belongs_to :user
  has_many :attendances
  has_many :comments
  has_many :users_commented, through: :comments, source: :user
  has_many :attendees, through: :attendances, source: :user
end
