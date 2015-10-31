class DecksController < ApplicationController
	before_action :require_login

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

	def require_login
		unless signed_in?
			flash[:error] = "Please login to view content"
			redirect_to root_path
		end
	end
end
