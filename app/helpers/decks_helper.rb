module DecksHelper
	def deck_creator?
		current_user.id == @deck.user_id
	end
end
