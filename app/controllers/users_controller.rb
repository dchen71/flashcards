class UsersController < ApplicationController
	def index
		@decks = current_user.decks
		@deck = Deck.new
	end
end
