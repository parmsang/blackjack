require_relative "deck"
require_relative "hand"

class Game
  include Deck
  
  attr_accessor :hand

  def deal
    @hand = Hand.new(deck.pop, deck.pop)
  end

end
