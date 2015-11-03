class DecksController < ApplicationController
	before_action :require_login
	before_action :last_visited, only: [:show]

	def new
		@deck = current_user.decks.build
	end

	def index
		@decks = current_user.decks.order(last_visited: :desc)
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

	def share
		@decks = Deck.where(share: true)
	end

	def show
		@deck = Deck.find(params[:id])
		@cards = @deck.cards
		@card = Deck.find(params[:id]).cards.build()
	end

	def update
		@deck = Deck.find(params[:id])
		@deck.update(deck_params)
		redirect_to :back
	end

	def destroy
		@deck = Deck.find(params[:id])
		@deck.destroy
		flash[:success] = "Deck successfully deleted"
		redirect_to decks_path
	end

	private

	def deck_params
		params.require(:deck).permit(:title)
	end

	#Updates the last visited
	def last_visited
	  Deck.find(params[:id]).update_attribute(:last_visited, DateTime.now)
	end
end

