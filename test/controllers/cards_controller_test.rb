require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  def setup
  	@user = users(:user1)
  	@deck = decks(:deck1)
  	@card = cards(:card1)
  end

  #Testing controller functionality
  test "should get able to create" do
  	sign_in @user
  	assert_difference('Card.count') do
  	  post(:create, {id: @deck.id, card: {front:'dog',back:'dog'}})
  	end
  	assert_redirected_to deck_path(@deck.id)
  end

  test "should get show" do
  	sign_in @user
  	get(:show, {id: @card.id})
  	assert_response :success
  end

  test "should edit" do
  	sign_in @user
  	patch(:edit, {id: @card.id, card: {front:'cat'}})
  	assert_equal "Card successfully edited", flash[:success]
  	assert_redirected_to deck_path(@card.deck_id)
  end

  test "should destroy" do
  	sign_in @user
  	assert_difference('Card.count', -1) do
  	  delete(:destroy, {id: @card.id})
  	end
  	assert_redirected_to deck_path(@card.deck_id)
  end

  #Testing required login functionality
  test "should redirect from create if not logged in" do
  	post(:create, {id:@deck.id, card: {front:'dog',back:'dog'}})
  	assert_redirected_to root_path
  end

  test "should redirect from show if not logged in" do
  	get(:show, {id: @card.id})
  	assert_redirected_to root_path
  end

  test "should redirect from edit if not logged in" do
  	patch(:edit, {id:@card.id})
  	assert_redirected_to root_path
  end

  test "should redirect from destroy if not logged in" do
  	assert_no_difference('Card.count') do
  	  delete :destroy, {id: @card.id}
  	end
  	assert_redirected_to root_path
  end
end



