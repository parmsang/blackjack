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

end
