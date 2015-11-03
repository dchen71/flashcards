require 'test_helper'

class CardsControllerTest < ActionController::TestCase
  def setup
  	@user = users(:user1)
  	@deck = decks(:deck1)
  	@card = cards(:card1)
  	@request.env['HTTP_REFERER'] = 'http://test.com/sessions/new'
  end

  #Testing controller functionality
  test "should get able to create" do
  	sign_in @user
  	assert_difference('Card.count') do
  	  post :create, card: {front:'dog',back:'dog', deck_id: @deck.id}
  	end
  	assert_response :success
  end

  test "should get show" do
  	sign_in @user
  	get(:show, {id: @card.id})
  	assert_response :success
  end

  test "should edit" do
  	sign_in @user
  	patch(:edit, {id: @card.id, front:'cat'}, card: {front:'cat'})
  	assert_response :success
  end

  test "should destroy" do
  	sign_in @user
  	assert_difference('Card.count', -1) do
  	  delete :destroy, {id: @card.id}
  	end
  	assert_redirected_to deck_path(@card.deck_id)
  end

  #Testing required login functionality
  test "should redirect from create if not logged in" do
  	post(:create, card: {front:'dog',back:'dog', deck_id: @deck.id})
  	assert_redirected_to root_path
  end

  test "should redirect from show if not logged in" do
  	get(:show, {id: @card.id})
  	assert_redirected_to root_path
  end

  test "should redirect from edit if not logged in" do
  	patch :edit, @card.id
  	assert_redirected_to root_path
  end

  test "should redirect from destroy if not logged in" do
  	assert_no_difference('Card.count') do
  	  delete :destroy, {id: @card.id}
  	end
  	assert_redirected_to root_path
  end
end



