require 'oystercard'

describe Oystercard do
  context "#balance" do
    it "has a balance" do
      expect(subject).to respond_to(:balance)
    end
    it "can be topped up" do
      a = Oystercard.new
      a.top_up(10)
      expect { subject.top_up(10) }.to change { subject.balance }.by(10)
    end
    it "can't be topped up more than £90" do
      limit = Oystercard::MAX_BALANCE
      expect { subject.top_up(limit + 1) }.to raise_error 'No, spend some first.' 
    end
  end
end
