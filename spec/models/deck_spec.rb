require "rails_helper"

describe Game do

  describe "Deck" do
    it { is_expected.to respond_to(:shuffle) }
    it { is_expected.to respond_to(:deck) }

    it "initialises with a deck of cards" do
      expect(subject.deck.length).to eq 52
    end

    it "shuffles the deck" do
      allow_any_instance_of(Array).to receive(:sample).and_return(:cards)
      expect(subject.deck).to eq :cards
    end

  end

end