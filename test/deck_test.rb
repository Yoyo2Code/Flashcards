gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'

class FlashCardsTest < Minitest::Test

  def test_creating_a_deck
    card_1 = FlashCard.new("What is 5 + 5?", "55")
    card_2 = FlashCard.new("What is 4 + 4?", "8")
    card_3 = FlashCard.new("What is 9 + 9?", "99")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_number_of_cards
    card_1 = FlashCard.new("What is 5 + 5?", "55")
    card_2 = FlashCard.new("What is 4 + 4?", "8")
    card_3 = FlashCard.new("What is 9 + 9?", "99")
    deck = Deck.new([card_1, card_2, card_3])
    assert_equal 3, deck.count
  end

  def test_one_card_in_deck
    card_1 = FlashCard.new("What is 5 + 5?", "55")
    deck = Deck.new([card_1])
    assert_equal 1, deck.count
    assert_equal card_1, deck.cards[0]
  end
end
