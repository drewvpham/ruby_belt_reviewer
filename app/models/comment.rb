class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  validates_presence_of :user, :event
  validates_presence_of :content, , message: "Comment cannot be empty!"
end
