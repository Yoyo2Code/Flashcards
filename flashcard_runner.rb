require './lib/flashcard'
require './lib/guess'
require './lib/deck'
require './lib/round'


# class CardGenerator
#
# #   def initialize


file_name = ARGV
f = File.new("#{file_name}")
f.each {|line| puts "#{f.lineno}: #{line}" }






    # file_name = ARGV
    # File.open("#{file_name}") if File::exists?( "#{file_name}" )
    # IO.each_line do |line|
    #   puts line
    # end

#     f = File.new(ARGV)
# f.each {|line| puts "#{f.lineno}: #{line}" }
#   end
# end
#   class FlashcardRunner
#
#     def initialize
#       card_1 = FlashCard.new("What is 5 + 5?","10")
#       card_2 = FlashCard.new("What is 1 + 1?","2")
#       card_3 = FlashCard.new("What is 4 + 4?","8")
#       card_4 = FlashCard.new("What is 2 + 2?","4")
#       deck = Deck.new([card_1, card_2, card_3, card_4])
#         round = Round.new(deck)
#     end
# end
      # cards = IO.readlines("text.txt")

# round.start
