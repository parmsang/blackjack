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
    new_card = ActionController::Base.helpers.asset_path("cards/#{@@game.hand.view.last.to_s}.png")
    data = { view: new_card, total: @@game.hand.total }
    render json: data
  end

  def stand
    @@game.stand
  end

  def winner?
    @@game.winner?
  end
end
