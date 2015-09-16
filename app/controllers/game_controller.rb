require 'game.rb'

class GameController < ApplicationController
  def index
    @@game = Game.new
    @@game.deal
    @game = @@game
  end

  def hit
    p @@game
    @@game.hit
    @@game.hand.total

    data = { view: @@game.hand.view.last, total: @@game.hand.total }
    render json: data
  end

  def stand
    @game.stand
  end

  def winner?
    @game.winner?
  end
end
