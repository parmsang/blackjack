require_relative "deck"
require_relative "hand"

class Game
  include Deck

  attr_accessor :hand

  def deal
    @hand = Hand.new(deck.pop, deck.pop)
  end

  def hit
    hand.hit(deck.pop)
  end

  def stand
    hand.stand
  end

end
