class DecksController < ApplicationController
	def new
		@deck = Deck.new
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
