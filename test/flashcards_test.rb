gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test
  def test_if_card_accepts_data
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end
end
