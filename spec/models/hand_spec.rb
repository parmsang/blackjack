require "rails_helper"

describe Hand do

  let(:subject) { Hand.new(:"4H", :AS) }

  it { is_expected.to respond_to(:view) }

  it "has a 2 card hand when created" do
    expect(subject.view.length).to eq 2
  end

  it { is_expected.to respond_to(:hit).with(1).argument }

  it "can hit for an extra card" do
    subject.hit(:"5D")
    expect(subject.view).to eq [:"4H", :AS, :"5D"]
  end

  it { is_expected.to respond_to(:total) }

  it "knows how much its hand is worth" do
    expect(subject.total).to eq 15
    subject.hit(:"TD")
    expect(subject.total).to eq 15
    hand = Hand.new(:AH,:AD)
    hand.hit(:"2D")
    hand.hit(:"8H")
    expect(hand.total).to eq 12
  end

  it {is_expected.to respond_to(:stand)}

  it "ends hand when player stands" do
    subject.stand
    expect(subject).to be_finished
  end

  it "raises error if you try to hit when hand has ended" do
    subject.stand
    expect{subject.hit(:AD)}.to raise_error 'Hand has ended!'
  end

  it "raises error if you try to hit when you have 21 or are bust" do
    expect(subject.total).to eq 15
    subject.hit(:"TD")
    expect(subject.total).to eq 15
    subject.hit(:"TC")
    expect(subject.total).to eq 25
    expect(subject).to be_finished
  end

end
