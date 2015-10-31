class DecksController < ApplicationController
	def new
		@deck = current_user.decks.build
	end

	def index
		@decks = current_user.decks
		@deck = current_user.decks.build
	end

	def create
		@deck = Deck.new(deck_params)
		if @deck.save
			flash.now[:success] = 'Deck successfully created'
		else
			flash.now[:info] = "Error creating deck"
		end

	end

	private

	def deck_params
		params.require(:deck).permit(:title)
	end
end
