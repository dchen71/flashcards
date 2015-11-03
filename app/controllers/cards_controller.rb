class CardsController < ApplicationController
	before_action :require_login

	def new
		@card = Deck.find(params[:id]).cards.build
	end

	def show
		@card = Card.find(params[:id])
		@deck = Deck.find_by(@card.deck_id)
	end

	def create
		@card = Deck.find(params[:id]).cards.build(card_params)
		if @card.save
			flash[:success]  = "Card successfully added"
			redirect_to deck_path(@card.deck_id)
		else
			flash[:error]  = "Error creating card"
			redirect_to deck_path(@card.deck_id)
		end
	end

	def edit
		@card = Card.find(params[:id])
		if @card.update(card_params)
			flash[:success]  = "Card successfully edited"
			redirect_to deck_path(@card.deck_id)
		else
			flash[:error]  = "Error editing card"
			redirect_to deck_path(@card.deck_id)
		end

	end

	def destroy
		@card = Card.find(params[:id])
		@id = @card.deck_id
		@card.destroy
		redirect_to(deck_path(@id))
	end

	private

	def card_params
		params.require(:card).permit(:front,:back)
	end
end
