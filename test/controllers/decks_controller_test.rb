require 'test_helper'

class DecksControllerTest < ActionController::TestCase
  def setup
  	@deck = decks(:deck1)
  	@user = users(:user1)
  end

  #Testing controller functionality
  test "new" do
    assert true
  end

  test "create" do
  	assert true
  end

  test "edit" do
  	assert true
  end

  test "show" do

  end

  test "destroy" do

  end

  test "redirect if not logged in" do
  	
  end

  test "redirect if not correct user or shared" do

  end
end
