require 'test_helper'

class DecksControllerTest < ActionController::TestCase
  def setup
  	@deck1 = decks(:deck1)
  	@deck2 = decks(:deck2)
  	@user1 = users(:user1)
  	@user2 = users(:user2)
  end

  #Testing controller functionality
  test "should post create" do
  	sign_in @user1
  	assert true
  end

  test "should patch edit" do
  	sign_in @user1
  	assert true
  end

  test "should show" do
  	sign_in @user1
  end

  test "should delete destroy" do
  	sign_in @user1
  end

  #Testing require login
  test "should redirect from create if not logged in" do
  	post(:create, deck:{title: 'cat'})
  	assert_redirected_to root_path
  end

  test "should redirect from edit if not logged in" do
  	patch(:edit, {id: @deck1.id, deck:{title: 'cat'}})
  	assert_redirected_to root_path
  end

  test "should redirect from show if not logged in" do
  	get(:show, {id:@deck1.id})
  	assert_redirected_to root_path
  end

  test "should redirect from update if not logged in" do
  	patch(:update, {id: @deck1.id, deck:{title: 'cat'}})
  	assert_redirected_to root_path
  end  

  test "should redirect from destroy if not logged in" do
  	delete(:destroy, {id:@deck1.id})
  	assert_redirected_to root_path
  end

  #Testing correct_user
  test "should redirect if not correct user or shared" do
  	sign_in @user2
  end

  #Testing last_visited
end

