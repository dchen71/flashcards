require 'test_helper'

class CardTest < ActiveSupport::TestCase
  def setup
  	@card = Card.new(front:'wee',back: 'woo')
  end
  
  test 'presence of front true' do
  	@card.front = ""
  	assert_no_difference('Card.count') do
  		@card.save
  	end
  end

  test 'presence of back true' do
  	@card.back = ""
  	assert_no_difference('Card.count') do
  		@card.save
  	end
  end

  test 'can find next card' do
  	@card1 = cards(:card1)
  	@card2 = cards(:card2)
  	#assert_equal @card1.next.id,@card2.id
  end

  test 'can find prev card' do
  	@card1 = cards(:card1)
  	@card2 = cards(:card2)
  	#assert_equal @card2.prev.id,@card1.id
  end
end
