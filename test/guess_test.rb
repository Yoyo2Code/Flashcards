gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test

  def test_making_a_response
    card = FlashCard.new("Where do you find Waldo?", "Mexico")
    guess = Guess.new("Alaska", card)
    assert_equal "Alaska", guess.response
  end

  def test_guess_displays_response
    card = FlashCard.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal true, guess.correct?
  end

  def test_for_correct_feedback
    card = FlashCard.new("How many toes are on my foot?", "6")
    guess = Guess.new("6", card)
    assert_equal "Correct!", guess.feedback
  end

  def test_for_incorrect_feedback
    card = FlashCard.new("How many toes are on my foot?", "6")
    guess = Guess.new("7", card)
    assert_equal "Sorry, Incorrect!", guess.feedback
  end

  def test_for_extra_character_in_response
    card = FlashCard.new("How many toes are on my foot?", "6")
    guess = Guess.new("6'", card)
    assert_equal "Sorry, Incorrect!", guess.feedback
  end
end
