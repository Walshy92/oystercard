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

  context "it has a defined state while in use" do
    it "responds to the touch_in method" do
      expect(subject).to respond_to :touch_in
    end
    it "starts their journey when touch_in is called"do
      subject.touch_in
      expect(subject).to be_in_journey
    end
    it "responds to the in_journey method" do
      expect(subject).to respond_to :in_journey?
    end
    it "knows that it is not in a journey unless it has been touched in" do
      expect(subject.in_journey?).to eq(false)
    end
    it "responds to the touch_out method" do
      expect(subject).to respond_to :touch_out
    end
    it "knows that when it has touched out, it is no longer in journey" do
      subject.touch_in
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end
end
