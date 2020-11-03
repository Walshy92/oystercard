require 'oystercard'

describe Oystercard do
  context "#balance" do
    it "has a balance" do
      expect(subject).to respond_to(:balance)
    end
    it "can be topped up" do
      expect(subject).to respond_to(:top_up).with(1).argument
    end
  end
end
