require 'test_helper'

class DeckTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  def setup
  	@user = users(:user1)
  	@deck = Deck.new(title: 'cat', user_id: @user.id)
  end

  test 'title presence is true' do
  	@deck.title = ""
  	assert_no_difference('Deck.count') do
  		@deck.save
  	end
  end

  test 'title max length is 30' do
  	@deck.title = "catdog1" * 5
  	assert_no_difference('Deck.count') do
  		@deck.save
  	end
  end  

  test 'last visited initalize to current time' do
  	@deck.save
  	#assert_equal @deck.last_visited, DateTime.now
  end

  test 'deck unique per userid' do
  	@deck.save
  	assert_no_difference('Deck.count') do
  		@deck.save
  	end
  end
end 
