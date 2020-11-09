  require 'journey'

  describe Journey do

     let(:entry) { double :entry }
     let(:exit) { double :exit }

    subject { Journey.new(entry)}
    context 'initialize method works' do
      it 'responds to the initialize method' do
        expect(subject.entry).to be entry
      end

      it 'initializes with an exit set to nil' do
        expect(subject.exit).to be nil
      end

      it 'at the end of the journey the exit station will be changed' do
        expect{ subject.end(exit) }.to change { subject.exit }
      end

      it  'will charge a minimum fee when touching in and out' do
        subject.entry
        subject.end(exit)
        expect(subject.fare).to eq (Journey::MIN_FARE)
      end

      it 'charge a penalty of 6 if only touched in' do
        expect(subject.fare).to eq (Journey::PEN_FARE)
      end

      it 'charges a penalty of 6 if only touched out' do
        
      end
    end
  end
