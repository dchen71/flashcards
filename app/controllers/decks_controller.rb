class DecksController < ApplicationController
	before_action :require_login
	before_action :last_visited, only: [:show]
	before_action :correct_user, only: [:show]
	before_action :creator?, only: [:edit, :delete]

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

	def edit
		@deck = Deck.find(params[:id])
		@deck.update(deck_params)
		redirect_to decks_path
	end

	def update
		@deck = Deck.find(params[:id])
		@deck.update(deck_params)
		redirect_to decks_path
	end

	def destroy
		@deck = Deck.find(params[:id])
		@deck.destroy
		flash[:success] = "Deck successfully deleted"
		redirect_to decks_path
	end

	private

	def deck_params
		params.require(:deck).permit(:title, :share)
	end

	#Updates the last visited
	def last_visited
	  Deck.find(params[:id]).update_attribute(:last_visited, DateTime.now)
	end

	#Checks if the owner of the deck is visiting or it is shared
	def correct_user
		unless current_user.id == Deck.find(params[:id]).user_id or Deck.find(params[:id]).share == true
			flash[:error] = "You do not have permission to look at this deck"
			redirect_to root_path
		end
	end

	#Checks if the current user is the creator of the deck
	def creator?
		unless current_user.id == Deck.find(params[:id]).user_id
			flash[:error] =  "You do not have permission to modify this deck"
			redirect_to root_path
		end
	end
	
end

