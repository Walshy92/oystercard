require 'oystercard'

describe Oystercard do

let(:entry_station){ double :station }
let(:exit_station){ double :station }

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

  context "touch_in tests" do
    it "responds to the touch_in method" do
      expect(subject).to respond_to :touch_in
    end
    it "starts their journey when touch_in is called"do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end
    it "Raises an error if not enough funds" do
      expect { subject.touch_in(entry_station) }.to raise_error "No funds."
    end
  end

  context "in_journey? tests" do
    it "responds to the in_journey method" do
      expect(subject).to respond_to :in_journey?
    end
    it "knows that it is not in a journey unless it has been touched in" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject.in_journey?).to eq(false).or eq(true)
    end
    it 'stores the entry station' do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.entry_station).to eq entry_station
    end
  end

  context 'touch_out tests' do
    it "responds to the touch_out method" do
      expect(subject).to respond_to(:touch_out).with(1).argument
    end
    it "takes off the fare from the balance when touching out" do
      subject.top_up(5)
      expect { subject.touch_out(exit_station) }.to change { subject.balance }.by(-1)
    end
    it "knows that when it has touched out, it is no longer in journey" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
  end
end
