class Hand

  attr_accessor :view

  def initialize(card1, card2)
    @view = [card1, card2]
    total == 21 ? @finished = true : @finished=false
  end

  def hit(card)
    fail 'Hand has ended!' if finished?
    view << card
    if (total >= 21)
      stand
    end
  end

  def stand
    @finished = true
  end

  def total
    total = 0

    sort.each do |x|
      if (x[0] == "T" || x[0] == "J" || x[0] == "Q" || x[0] == "K")
        total += 10
      else
        total += x[0].to_i
      end
    end

    if ace_count > 0 && ((total + 11 + ace_count - 1) > 21)
      total += ace_count
    elsif ace_count > 0
      total += 10 + ace_count
    end

    total
  end

  def finished?
    @finished
  end

  private

  def sort
    sorted = []
    view.each { |x|  sorted.push(x) if x[0] != "A" }
    sorted
  end

  def ace_count
    count = 0
    view.each { |x|  count += 1 if x[0] == "A" }
    count
  end

end
