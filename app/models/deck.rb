class Deck < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true, uniqueness: {scope: :user_id}, length: {maximum: 30}
  validates :user_id, presence: true
end
