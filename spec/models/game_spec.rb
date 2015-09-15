require "rails_helper"

describe Game do

let(:hand) {double :hand}

  it { is_expected.to respond_to(:deal) }
  it {is_expected.to respond_to(:hand)}

  it "deals a hand" do
    allow(Hand).to receive(:new) {hand}
    subject.deal
    expect(subject.hand).to eq hand
  end

  it "lets player decide to hit" do
    hand = spy :hand
    allow(Hand).to receive(:new) {hand}
    subject.deal
    subject.hit
    expect(hand).to have_received(:hit)
  end

  it "lets player decide to stand" do
    hand = spy :hand
    allow(Hand).to receive(:new) {hand}
    subject.deal
    subject.stand
    expect(hand).to have_received(:stand)
  end

end
