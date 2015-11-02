class Deck < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}, length: {maximum: 30}
  validates :user_id, presence: true
  before_create :set_last_visited_to_now

  def set_last_visited_to_now
  	self.last_visited = DateTime.now
  end
end
