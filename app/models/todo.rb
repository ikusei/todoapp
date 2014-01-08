class Todo < ActiveRecord::Base
  validates :todo_item, presence: true
  belongs_to :user
end
