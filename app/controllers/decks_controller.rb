class DecksController < ApplicationController
	def new
		@deck = current_user.decks.build
	end

	def index
		@decks = current_user.decks
		@deck = current_user.decks.build
	end

	def create
		@deck = current_user.decks.build(deck_params)
		if @deck.save
			flash[:success] = 'Deck successfully created'
			redirect_to decks_path
		else
			flash[:error] = "Error creating deck"
			redirect_to decks_path
		end

	end

	private

	def deck_params
		params.require(:deck).permit(:title)
	end
end
