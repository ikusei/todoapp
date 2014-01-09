class Todo < ActiveRecord::Base
  validates :todo_item, presence: true
  #validates :user_id, presence: true

  belongs_to :user
  
  #default_scope -> { order('created_at DESC') }
end
