class Card < ActiveRecord::Base
	belongs_to :deck
	validates :front, :back, presence: true

	#Checks if cards has more entry/deck
	def next
	  self.class.where("deck_id == ?", deck_id).where("id > ?", id).first
	end

	def previous
	  self.class.where("deck_id == ?", deck_id).where("id < ?", id).last
	end
end
