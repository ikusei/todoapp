class Todo < ActiveRecord::Base
  belongs_to :user

  validates :todo_item, presence: true
  validates :user_id, presence: true
 
 default_scope order: 'todos.created_at DESC'
end
