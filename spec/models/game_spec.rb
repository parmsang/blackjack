require "rails_helper"

describe Game do

let(:hand) {double :hand}

  it { is_expected.to respond_to(:deal) }
  it {is_expected.to respond_to(:hand)}
  it { is_expected.to respond_to(:winner?) }

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

  it "lets player know if he has won the hand" do
    allow(Hand).to receive(:new) {hand}
    subject.deal
    allow(hand).to receive(:total) {21}
    allow(hand).to receive(:finished?) {true}
    expect(subject.winner?).to eq true
  end

  it "lets player know if he has lost the hand" do
    allow(Hand).to receive(:new) {hand}
    subject.deal
    allow(hand).to receive(:total) {22}
    allow(hand).to receive(:finished?) {true}
    expect(subject.winner?).to eq false
  end

  it "there is no winner or loser if the hand has not finished" do
    allow(Hand).to receive(:new) {hand}
    subject.deal
    allow(hand).to receive(:total) {15}
    allow(hand).to receive(:finished?) {false}
    expect(subject.winner?).to eq nil
  end

end
