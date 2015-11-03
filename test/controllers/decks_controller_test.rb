require 'test_helper'

class DecksControllerTest < ActionController::TestCase
  def setup
  	@deck1 = decks(:deck1)
  	@deck2 = decks(:deck2)
  	@user1 = users(:user1)
  	@user2 = users(:user2)
  end

  #Testing controller functionality
  test "should get index" do
  	sign_in @user1
  	get :index
  	assert_response :success
  end

  test "should post create" do
  	sign_in @user1
  	assert_difference('Deck.count') do
  		post(:create, deck:{title: 'cat'})
  	end
  	assert_equal "Deck successfully created", flash[:success]
  	assert_redirected_to decks_path
  end

  test "should patch edit" do
  	sign_in @user1
  	patch(:edit, {id: @deck1.id, deck:{title: 'cat'}})
  	assert_redirected_to decks_path
  end

  test "should patch update" do
  	sign_in @user1
  	patch(:update, {id: @deck1.id, deck:{title: 'cat'}})
  	assert_redirected_to decks_path
  end

  test "should show" do
  	sign_in @user1
  	get(:show, {id: @deck1.id})
  	assert :success
  end

  test "should delete destroy" do
  	sign_in @user1
  	assert_difference('Deck.count', -1) do
  		delete(:destroy, {id:@deck1.id})	
  	end
  	assert_equal "Deck successfully deleted", flash[:success]
  	assert_redirected_to decks_path
  end

  #Testing require login
  test "should redirect from index if not logged in" do
  	get :index
  	assert_redirected_to root_path
  end

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

  #Testing correct_user/shared
  test "should redirect if not correct user or shared" do
  	sign_in @user2
  	get(:show,{id: @deck1.id})
  	assert_redirected_to root_path
  end  

  #Testing last_visited
  test "should update time from show" do
  	sign_in @user1
  	get(:show, {id:@deck1.id})
  	#assert_equal @deck1.last_visited, DateTime.now
  end
end

