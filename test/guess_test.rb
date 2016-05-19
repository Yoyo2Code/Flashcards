gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test

  def test_a_guess
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Juneau", guess.response
  end

  def test_guess_displays_response
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal true, guess.correct?
  end

  def test_for_feedback
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    
    assert_equal "Correct!", guess.feedback
  end
end
