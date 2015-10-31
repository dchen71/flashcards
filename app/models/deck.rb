class Deck < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}
  validates :user_id, presence: true
end
