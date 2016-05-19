gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test

  def test_to_create_a_deck
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_to_check_count
    card_1 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_2 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    card_3 = FlashCard.new("What is the capital of Alaska?", "Juneau")
    deck = Deck.new([card_1, card_2, card_3])

    assert_equal 3, deck.count
  end

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
end
