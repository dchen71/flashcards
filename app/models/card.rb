class Card < ActiveRecord::Base
	belongs_to :deck
	validates :front, :back, presence: true
end
